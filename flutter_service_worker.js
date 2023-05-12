'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "f1c014b126f2c0ad48115cad3f8fe33c",
"assets/AssetManifest.json": "3ae5986a29d5d05ac45ee7c3eed74b72",
"assets/assets/images/avatar_pic.jpg": "ce82971909ea29063c7878ae547f20a3",
"assets/assets/images/evosus-logo-dark.png": "c128d7356fa55058c11f4eff3a294859",
"assets/assets/images/evosus-logo-light.png": "7ae5b8b92178c736cc5cc587515c636e",
"assets/assets/images/header-logo.png": "ed483d77d3892865c95f1d27dbbd6542",
"assets/assets/images/header-logo.svg": "f24866cddeb8ab17bc7a4f5b8dab2f19",
"assets/assets/images/isoft-logo-dark.png": "95a7763f3c43540698f65b467f7647ad",
"assets/assets/images/isoft-logo-light.png": "5ebdd9e56846b222690ac8b8e0bcac12",
"assets/assets/images/logo-bw.png": "b126a909af31c3e8079520cae12e5c4f",
"assets/assets/images/logo-outline.png": "7712f18ac0ef12d10f0bdae515ba7ea1",
"assets/assets/images/logo-wbg.png": "3833b143d8ed7719a1299120a47b1110",
"assets/assets/images/logo-wbg.svg": "fc851ca7b4adc116a1128f8cd376af46",
"assets/assets/images/logo.png": "cb9e4dd46c77439b8aee9b52fd5e998e",
"assets/assets/images/logo.svg": "022b4460fc508c6a4c8c628c6154f36d",
"assets/assets/images/me.jpg": "b33ad4f246e66ae2d562e659dd38fec0",
"assets/assets/images/mtg-logo.png": "d6b8410bb1c8cfb5a4c34dfb054b2766",
"assets/assets/images/nyan.gif": "7e982f6859d7d5c600d1506ce82cf52e",
"assets/assets/images/psu.jpg": "6fc5d348f433b151fad3ec1a5d9c01a3",
"assets/assets/images/pw-logo.png": "77c65e2380b9e259c168e08f4a33a724",
"assets/assets/images/pw-logo.svg": "3de9427607466a134d969ba928624f3f",
"assets/assets/images/sou.jpg": "01791b589ab79a8d825ab297107941f0",
"assets/assets/images/soundcloud-logo.png": "cf27c3b6c391144908ba0dd2f9631c11",
"assets/FontManifest.json": "3f768ae705296be001f7819d2895cc30",
"assets/fonts/MaterialIcons-Regular.otf": "397756f7c21475fcf123eb862e41bb58",
"assets/NOTICES": "358d6ec0bcdc649d122098e9be2365dc",
"assets/packages/community_material_icon/fonts/materialdesignicons-webfont.ttf": "84c7bd136590da0a6ed2c21df180c354",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "7a26ea9d4e61122fc023b84e5acdb148",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/favicon.png": "7a26ea9d4e61122fc023b84e5acdb148",
"icons/Icon-192.png": "12d05db1c0b26d429b54e3f8c946a496",
"icons/Icon-512.png": "aabba36693aba0ec8d954adf297d3125",
"index.html": "1fe52434b488b6cf079d23cdfd86ea65",
"/": "1fe52434b488b6cf079d23cdfd86ea65",
"main.dart.js": "24ca2d06e9192770aaa83bd0bdf291a8",
"manifest.json": "8f5426026303f2d7239f1a6aae20eb40",
"version.json": "5cc9695ee3e8c1f86234c524152ea8f8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
