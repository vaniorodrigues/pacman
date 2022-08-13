'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "0dabf63f7d44fbbfc3b68156bfbafeb8",
"assets/assets/images/food.png": "00abdd082a39999018885904426e299f",
"assets/assets/images/ghost/blue.png": "c31535eac1ea6dc2e056eb6e7c7e9944",
"assets/assets/images/ghost/dead.png": "c4151e3fef1c7ac4865984d3f1f68aba",
"assets/assets/images/ghost/orange.png": "e9bb6fa362683db249f0dca0d4308839",
"assets/assets/images/ghost/pacman_spritesheet.png": "3b0edc90f020280cbd45e20046138b1f",
"assets/assets/images/ghost/pacman_spritesheet2png.png": "3e31c9fea42c27d7af8c0db538d0c05e",
"assets/assets/images/ghost/pink.png": "38c4773e186df29328cc2b6aafc6f607",
"assets/assets/images/ghost/red.png": "a3ecaebbaa9d7916080bf0a206669df0",
"assets/assets/images/ghost/scared.png": "2c73bd3aaa6c428c2cc5b7ae5cb67ec6",
"assets/assets/images/pacman/pacman_spritesheet.json": "9e4e537546cda72f070d2520db668cf2",
"assets/assets/images/pacman/pacman_spritesheet.png": "3b0edc90f020280cbd45e20046138b1f",
"assets/assets/images/pacman/pac_map.json": "7d2605205b04d0c33fe54b5da235a5b7",
"assets/assets/images/player/pacman.png": "00b9e1d913459e264f5e0ee41f8acced",
"assets/assets/images/player/pacman_death.png": "ed7985ba2994e8da6bb451d060879fd6",
"assets/assets/images/player/pacman_idle.png": "9302b0f82d42be43e5db96455bb08826",
"assets/assets/images/player/pacman_spritesheet.png": "3b0edc90f020280cbd45e20046138b1f",
"assets/assets/images/player/pac_idle_down.png": "e011d7614dc1de060f48846aa618525a",
"assets/assets/images/player/pac_idle_right.png": "8b7a7f1dadcb6dabf2db3df3fd36f0ea",
"assets/assets/images/player/pac_run_down.png": "6aa9ab86511b091dde86ec9c8e74794c",
"assets/assets/images/player/pac_run_right.png": "631f927d2e9ef6efd0041e76255ae534",
"assets/assets/images/player/pac_run_up.png": "991d6584cbe2bf6107699ed277b23b58",
"assets/assets/images/powerUp.png": "ef40550cb4a62e4615b625f82194c0f7",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "5c95e7df46198ce89249af9d70410da0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "8b7a7f1dadcb6dabf2db3df3fd36f0ea",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "e994a1f91fab22c73234a22062ecd7e8",
"/": "e994a1f91fab22c73234a22062ecd7e8",
"main.dart.js": "fc63e4eb796b1ea0dec11cc719ed459f",
"manifest.json": "efb19d69bd0b551819b713357f9fccfc",
"version.json": "765d559b498189c6f4f8f7cf3571babf"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
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
