'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "1a6c43a151d74ada7ce38e941c7a6c16",
"assets/assets/images/logo-outline.png": "7712f18ac0ef12d10f0bdae515ba7ea1",
"assets/assets/images/logo-wbg.png": "3833b143d8ed7719a1299120a47b1110",
"assets/assets/images/nyan.gif": "7e982f6859d7d5c600d1506ce82cf52e",
"assets/assets/images/psu.jpg": "6fc5d348f433b151fad3ec1a5d9c01a3",
"assets/assets/images/sou.jpg": "01791b589ab79a8d825ab297107941f0",
"assets/assets/images/vscode.svg": "2a1a2bebce77c639a461658a0da9e827",
"assets/assets/images/webapp.png": "508f309b1c78db29177442d1c1e2a190",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/images/header-logo.png": "ed483d77d3892865c95f1d27dbbd6542",
"assets/images/header-logo.svg": "f24866cddeb8ab17bc7a4f5b8dab2f19",
"assets/images/logo-bw.png": "b126a909af31c3e8079520cae12e5c4f",
"assets/images/logo-outline.png": "7712f18ac0ef12d10f0bdae515ba7ea1",
"assets/images/logo-wbg.png": "3833b143d8ed7719a1299120a47b1110",
"assets/images/logo-wbg.svg": "fc851ca7b4adc116a1128f8cd376af46",
"assets/images/logo.png": "cb9e4dd46c77439b8aee9b52fd5e998e",
"assets/images/logo.svg": "022b4460fc508c6a4c8c628c6154f36d",
"assets/images/nyan.gif": "7e982f6859d7d5c600d1506ce82cf52e",
"assets/images/psu.jpg": "6fc5d348f433b151fad3ec1a5d9c01a3",
"assets/images/pw-logo.png": "77c65e2380b9e259c168e08f4a33a724",
"assets/images/pw-logo.svg": "1b366d7e438bd39fff8bec934b9e426f",
"assets/images/sou.jpg": "01791b589ab79a8d825ab297107941f0",
"assets/NOTICES": "4dc2564f3dee4f3c0e17cdd20c0f6b96",
"favicon.png": "fa7fde306a35e196516bf8b1d6100f14",
"icons/favicon.png": "fa7fde306a35e196516bf8b1d6100f14",
"icons/Icon-192.png": "8afa706053b186edf013b6c9880872f9",
"icons/Icon-512.png": "70dd4c7d62910514def11f21e23d99f8",
"index.html": "907dc45e90eda071f535ecc46a33d0c7",
"/": "907dc45e90eda071f535ecc46a33d0c7",
"main.dart.js": "9c0d6c89206373b66ec393c78ce3f7a5",
"manifest.json": "ef22af793dc356468ea258e68a06f25c",
"version.json": "0323328b10ae5e701c91561f7e8a8f65"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
