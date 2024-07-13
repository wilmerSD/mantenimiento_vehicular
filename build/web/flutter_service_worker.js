'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "31f7eaa3f4d8a68981f474c628b21fb0",
"index.html": "df432c091edace87b971f4c433fc646d",
"/": "df432c091edace87b971f4c433fc646d",
"main.dart.js": "d5a66f0f0b2a82d466c7fd544ada63e4",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "2bfb6e7215dd0f6a80aef9fbecca706e",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "11df9f1aaa9e5f5261523b1a1d3b5e5b",
"assets/AssetManifest.json": "13cdd0d676bd54ab15e6ca0be96ffcbe",
"assets/NOTICES": "c54fd1faecea28987573eafcfeb62c5d",
"assets/FontManifest.json": "29f38e0ae0cb8bbc2b43e6d655fd1894",
"assets/AssetManifest.bin.json": "786e8aa24041cbfd5421a431652aed39",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/packages/iconsax/lib/assets/fonts/iconsax.ttf": "071d77779414a409552e0584dcbfd03d",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "8482bad9442587831dcc1be5a1fb05fa",
"assets/fonts/montserrat/Montserrat-Bold.ttf": "ed86af2ed5bbaf879e9f2ec2e2eac929",
"assets/fonts/montserrat/Montserrat-Regular.ttf": "5e077c15f6e1d334dd4e9be62b28ac75",
"assets/fonts/montserrat/Montserrat-Italic.ttf": "cc53ad8bb1c801746c831bb7ce493f74",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/markerValtx.png": "58c272776537bd1388def8388f8ce01c",
"assets/assets/reunion.jpg": "c3befe0ac7027cfbbc0e9de9e3c0bbf2",
"assets/assets/img/check.png": "c3e07e9438cbb629215fa1b840ee7b12",
"assets/assets/img/exportpdf.png": "c1c16684fa5d8687d1f457553d99e365",
"assets/assets/img/telefonito.png": "6f644d14288f89e6357f79d76e804625",
"assets/assets/img/banner-bg4.png": "1cab071d5033f720ff8bb285fc1d88ce",
"assets/assets/img/fondonew.png": "13158e5f112bd3d30b233a2382fc5f6e",
"assets/assets/img/exportcsv.png": "7e4672db3da58805966fb10125418ff9",
"assets/assets/img/timer_ico.png": "46699adf48fcd46ffb580a90b90d096c",
"assets/assets/img/ico_deleted.png": "a48abc7e0c4ba4ac0f0bdc1c64ca2e42",
"assets/assets/img/newmenssage.png": "88360406556e4aad04e0cf34718e6984",
"assets/assets/img/logostele.jpg": "2b1ace5637e7eb543888e33012fbca3b",
"assets/assets/img/newlogotelefonica.png": "001a3de89cdaa6133e8de7c9b7c976fc",
"assets/assets/img/rectangle.png": "31cf1462663c5c9eb99306cdad659b5c",
"assets/assets/img/logotipotelefonica.png": "b73d0389cac7dc3e32d26488c254d92d",
"assets/assets/img/changePass.png": "e132460ababb19a9e1ef3c1b2d7243d2",
"assets/assets/img/warning_ico.png": "6d67279678105ba2c0cfe69f8d33a8a5",
"assets/assets/img/exportexcel.png": "6fb24aa3ab60f66c00cbec482d327886",
"assets/assets/img/ico_user_nav.png": "e5e3975c5779baa7a3a0c5b39a788bb1",
"assets/assets/img/valtx.png": "2959de73feee214e2ad730491c9eafd3",
"assets/assets/img/group_logos.png": "c99c8526c7cd4d9d8c2f7a76eec34576",
"assets/assets/img/error404.png": "3bb930c483f284efdd5d716e985277d1",
"assets/assets/img/carro02.png": "4de91b15a58d3157c167033de71b7121",
"assets/assets/img/profile.png": "c9a48b3e63a96691e3164296cac83550",
"assets/assets/img/planets.jpg": "6a75fd64878135cb1160169c9082e9bb",
"assets/assets/img/unidosnew.jpg": "5644998eb4127ac0ed0cb93ac04452cd",
"assets/assets/img/ico2.png": "3d62b63e0d560246b4a2ea20693ee6d1",
"assets/assets/img/ico3.png": "4298463be55f5cd8be14cfc90dea3d77",
"assets/assets/img/ico1.png": "3421d8e4ebf0658ba8fd5c51237a78c3",
"assets/assets/img/succes_ico.png": "1be8f1da17d515a40b6053a25d499bd4",
"assets/assets/img/tib.png": "7e4da282c829ad06cdb30b65f80ba50a",
"assets/assets/img/p.jpg": "97bbfb0ca58ff30ed57673a777b6b768",
"assets/assets/img/ciudad.jpg": "c72f7690a64baad91fbcc9a0e1f0fd4b",
"assets/assets/img/error_ico.png": "acf53b0bee98aa28a932aa9e6697903a",
"assets/assets/icons/add.png": "a819415db8bc62d71a1ddbf4d177a24d",
"assets/assets/icons/file_evaluation.png": "271c223076a6c4940c9495243e11656a",
"assets/assets/icons/note-add.png": "7d6012d332cd59c16ef15216844f444d",
"assets/assets/icons/login.png": "d9eb043a85c721af8c2ed0f9dfcd4723",
"assets/assets/icons/message-question.png": "b4fe49e89c60ad723bf875da0dd1be75",
"assets/assets/icons/download.png": "1bcf1134a6101de8a5707c39af3e9f9c",
"assets/assets/icons/close-circle.png": "63d34b5a0f2740bc2becdc775e501a6e",
"assets/assets/icons/group.png": "5a14d92e7fa70afcf0f56d3c0c3e6d56",
"assets/assets/icons/ico_ultima_calification.png": "c47411ca62ae6c68712181ba62225c79",
"assets/assets/icons/space_white.png": "50f36f7a11e68cc1e6024d597f4c5f0a",
"assets/assets/icons/arrow-right.png": "0118942071d1b00dd4ce641ebf8c5590",
"assets/assets/icons/store.png": "a6a087bb031bb519a49072869e56bff8",
"assets/assets/icons/empty-wallet.png": "1e4de49b97b991fdaeafda2af70a1693",
"assets/assets/icons/chart-2.png": "73174c593747594412da7dedbda9a377",
"assets/assets/icons/ico-mode-list.png": "670abc9dabda4fd512c62476654b0609",
"assets/assets/icons/user_evaluation.png": "a57bb9e4594ab96739c2cf8778f03354",
"assets/assets/icons/export.png": "0ff6255f6ffa337ffeddf4007c9f4314",
"assets/assets/icons/rectification.png": "02554dc0e08c405f5bc0d5e56d6a24c9",
"assets/assets/icons/home.png": "e12609c8a70f784db7c0a1adc6b04f95",
"assets/assets/icons/user.png": "e01ce7a8a388a0c8c5b9c24b652edc49",
"assets/assets/icons/play-circle.png": "f9122f4d1c4e5361f4e50c6d1853fc80",
"assets/assets/icons/trush-square.png": "76a6e445afd2a45238cfc4b088196f59",
"assets/assets/icons/arrow-down.png": "2b56ba9492ae22f9e3cf6e5bf6f72861",
"assets/assets/icons/ico_pdf.png": "c282b9d2b33517f081beb7f15152ca21",
"assets/assets/icons/search.png": "4cb99746c2bffd3d602bf4831579a506",
"assets/assets/icons/card-add.png": "be1123953e19130c975bc0fbf5dea1ba",
"assets/assets/icons/ico_excel.png": "e63c4f9fb3232daa3ead2b149db67747",
"assets/assets/icons/menu.png": "d591308c7eac0f224c2a84fa4c10b126",
"assets/assets/icons/status.png": "6b69d71eb331f52e780773069848d952",
"assets/assets/icons/setting-2.png": "bc6afebdedabb7e31ced5fc147b0b562",
"assets/assets/icons/bussines.png": "daf793253df1f9b31177f7f6005c666c",
"assets/assets/icons/arrow-left.png": "456f639af83f10b9b17ce5236cdb1de1",
"assets/assets/icons/lamp-charge.png": "003799455439a26bcb45cbbacbe10021",
"assets/assets/icons/calendar.png": "2d419d0a6379abe2ba5834a2ff023f25",
"assets/assets/icons/arrow-up.png": "42fa1b422a3b5eb162a6e1483c8ccc1e",
"assets/assets/icons/eye.png": "609814efa46092cdfd043b4fc56decde",
"assets/assets/icons/ico_tracking.png": "2d93d5ab52080fea4d7455e43dad658d",
"assets/assets/icons/receipt-edit.png": "58d047415d0be1a608f96606adbac745",
"assets/assets/icons/location.png": "c6606f2195cc36a1cd62fa64083a4ced",
"assets/assets/icons/clock.png": "82ec7ac44457d30f7e60a1f2f4956547",
"assets/assets/icons/edit.png": "fbd35ac3e34ab3d5c7c3b72fa4c88a48",
"assets/assets/icons/danger.png": "6422d95d16e2d419c6e98bbd249d9505",
"assets/assets/icons/parameters.png": "2b0f326d784b784aa6e78909cbd45c9a",
"assets/assets/icons/select_archive.png": "49a15cc61a31604c8755806f1d0bcddc",
"assets/assets/icons/security.png": "0717823053f1543803779be64bd7eb71",
"assets/assets/icons/obs_evaluation.png": "7747d7dd0f33fe7ac0df84b2aca89ac7",
"assets/assets/icons/tick-circle.png": "addbaba61b71525c679a7a5e79a41285",
"assets/assets/icons/store_evaluation.png": "67a20bd3f1c760f69faa7d81679e629d",
"assets/assets/icons/eye-slash.png": "a145fbdda4c20fb6759b14e45293372d",
"assets/assets/icons/subsanation_evaluation.png": "0ba9c27192f6f701fe8898e671b81cae",
"assets/assets/icons/calendar-edit.png": "c1eb47dbe462e8b078d811a7361df79e",
"assets/assets/icons/element-4.png": "5cf037f7e36962f554d2a8949b9232cf",
"assets/assets/icons/info-circle.png": "a7c497c3afc1ef08a924cb7e51fb439d",
"assets/assets/icons/close.png": "cdc7b2d67f3ee9ec541d485973b0b3e6",
"assets/assets/carro02.png": "4de91b15a58d3157c167033de71b7121",
"assets/assets/whatsapp.png": "64955b289c3856ad31744d47419f6be2",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
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
