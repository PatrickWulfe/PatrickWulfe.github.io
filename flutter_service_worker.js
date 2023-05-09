'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "e4af4ca18c4651b5d703649e8b623395",
".git/config": "7e4a3f7425281199197e70be96ca294a",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "e86d6023772ff1650e57666b30988bcd",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "c4840d724a4290d0801d84a95f14b9e1",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "be816262aa3c2fabd714eba6df5ee83e",
".git/logs/refs/heads/main": "7f8f5bab060a8a167b28b0e5ef7ae694",
".git/logs/refs/remotes/origin/main": "867d53eccedf2e59af7e7bd6b403cb84",
".git/objects/03/106b21fd": "dda0af9e7fc1ac9fad163f8df3af9d9d",
".git/objects/03/8781bf54": "dda0af9e7fc1ac9fad163f8df3af9d9d",
".git/objects/05/a8268193": "4245037f8c7f24b24330548c5152bcb8",
".git/objects/09/f946577175a43dc4900c94f547ad1552f8425a": "9e29fa86b4099df885f6842dc3634c07",
".git/objects/22/26e4dfb0a95bd9c404de6569211f1b9b4d7e22": "037233a103abdf30e6171a6e62ca1433",
".git/objects/2c/1074fb9acc059f6c4e2b642f2cefe930f28a7f": "09c81b9ebce3ad715f3b760fd68fe754",
".git/objects/2f/00dc56813d73d63ebd700fce241053b93ed050": "281975499af75b050ff7fa5ab56e16d8",
".git/objects/48/8428be94ebd983270fb30fe0b3be801daa44ca": "df49e545c1a8befaba64d3a22228f5df",
".git/objects/4b/d3b9bd277c4029f2e5b1a2981fd33ba5f965ec": "ce970fe1366ad3e0db7193cba2cd08fc",
".git/objects/66/a69cb1850861f675e7ae3e8a650aca116a62a1": "8d3a836560d6c5a15c1662e6c90680ac",
".git/objects/69/c31fc5d462286102af408cc9ee0d9b40eae356": "d4f8f2735da8694f4fec1a3906aaeb85",
".git/objects/6f/0b203f479571a688095bc49556298cc7668ff1": "9278e0b1e14659af088b1031c0c5043b",
".git/objects/7c/95d4d9980652b0fabdc7ab942313a23a5b4a8a": "3900cfe79fd9ea13f52b61929186221c",
".git/objects/84/2fe32d2851d4de005b9aef4b34d30bf58f8488": "7a0b8db502bf0cde8026beae4fea881d",
".git/objects/85/67e9a29d960ca3394dae49fd44a48447bc1d4d": "a5077e4611f2e35b0f8e8a70c48b4351",
".git/objects/9a/2a3c7d73ac3f5f11cf2d5753931f79a2f68f78": "5da317a1821f12029d97d88c28ba04e4",
".git/objects/a6/9268dd303bde5df23f1ff41fe131293b8a08ba": "02ebfe50b006128e9f3f47d0cd2e6be3",
".git/objects/ad/78c8205482067a12882ec00b809e767ba5b5b1": "d5b6d54ad13f8a86f1bc2d39a38cc4a5",
".git/objects/ae/f376bd0c4c4ed48e579d028a6f11814608379e": "8b2f3c958c900e40f0a9ee562ad49b04",
".git/objects/b1/c0b1c3d385e250127fe3fbd2b551d1624b8395": "715d8db1fd2151a4062e10dc4479b42a",
".git/objects/c6/ab520e09a7f2a104abfa13f70dd8b28d0bb0df": "a2863959f541889a57049db93680951b",
".git/objects/d0/a09c3d60a81d789742d3039d1a3e5b424c5f6f": "7833b72ffab28ce959a44163bedb05f4",
".git/objects/d2/984118c3868d189c0ccadf7cf59a006adfb64b": "0a2312b750d32e0e68291ab3771058fe",
".git/objects/d6/34de65b143d0a57baff3f164de331acaf69ef3": "bf5d5719006f221b51fe09726bad9223",
".git/objects/d9/20815d38d2392bda953fb2c019604b20b12ce9": "75f7b444046e4c5e48895e4b8d836ef1",
".git/objects/eb/3e17214e1ee6259a26dc0cd5f18a1718ce17cd": "0e2086f53075a09083753dfa30049a3f",
".git/objects/f1/93d95f4f8ff0d3064844ccb41427f23b1cfa89": "e7e6d40b961cb5a5de29b041fdd9a91b",
".git/ORIG_HEAD": "045fecf467aae4bcfb1ff155138d7979",
".git/refs/heads/main": "045fecf467aae4bcfb1ff155138d7979",
".git/refs/remotes/origin/main": "045fecf467aae4bcfb1ff155138d7979",
".github/workflows/dotenv.yml": "7e189c9c0bc346c2a26ae41d1803d716",
"assets/AssetManifest.json": "09d35d25321c730dbfc2ea321dda269f",
"assets/assets/images/avatar_pic.jpg": "ce82971909ea29063c7878ae547f20a3",
"assets/assets/images/header-logo.png": "ed483d77d3892865c95f1d27dbbd6542",
"assets/assets/images/header-logo.svg": "f24866cddeb8ab17bc7a4f5b8dab2f19",
"assets/assets/images/logo-bw.png": "b126a909af31c3e8079520cae12e5c4f",
"assets/assets/images/logo-outline.png": "7712f18ac0ef12d10f0bdae515ba7ea1",
"assets/assets/images/logo-wbg.png": "3833b143d8ed7719a1299120a47b1110",
"assets/assets/images/logo-wbg.svg": "fc851ca7b4adc116a1128f8cd376af46",
"assets/assets/images/logo.png": "cb9e4dd46c77439b8aee9b52fd5e998e",
"assets/assets/images/logo.svg": "022b4460fc508c6a4c8c628c6154f36d",
"assets/assets/images/me.jpg": "b33ad4f246e66ae2d562e659dd38fec0",
"assets/assets/images/nyan.gif": "7e982f6859d7d5c600d1506ce82cf52e",
"assets/assets/images/psu.jpg": "6fc5d348f433b151fad3ec1a5d9c01a3",
"assets/assets/images/pw-logo.png": "77c65e2380b9e259c168e08f4a33a724",
"assets/assets/images/pw-logo.svg": "3de9427607466a134d969ba928624f3f",
"assets/assets/images/sou.jpg": "01791b589ab79a8d825ab297107941f0",
"assets/FontManifest.json": "3f768ae705296be001f7819d2895cc30",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/NOTICES": "c2fbd1afc1638b5a53b49319fe27c3b0",
"assets/packages/community_material_icon/fonts/materialdesignicons-webfont.ttf": "174c02fc4609e8fc4389f5d21f16a296",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"favicon.png": "7a26ea9d4e61122fc023b84e5acdb148",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"icons/favicon.png": "7a26ea9d4e61122fc023b84e5acdb148",
"icons/Icon-192.png": "12d05db1c0b26d429b54e3f8c946a496",
"icons/Icon-512.png": "aabba36693aba0ec8d954adf297d3125",
"index.html": "a6f3f4baed7bb25f614c4b6f94833efa",
"/": "a6f3f4baed7bb25f614c4b6f94833efa",
"main.dart.js": "a7e85f8af85ab90cf083eef57a7576ba",
"manifest.json": "8f5426026303f2d7239f1a6aae20eb40",
"README.md": "8e646140067e1e32656ce4c123bce524",
"version.json": "5cc9695ee3e8c1f86234c524152ea8f8"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
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
