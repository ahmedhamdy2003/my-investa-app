// // ignore_for_file: depend_on_referenced_packages

// import 'dart:developer';
// import 'dart:io';

// import 'package:investa4/core/model/user.dart';
// import 'package:investa4/objectbox.g.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

// class ObjectBoxManager {
//   static Store? _store;
//   static late Box<UserModel> userBox;
//   // static late Box<MatchStandard> matchStandardBox;
//   static Future<void> init() async {
//     log('ObjectBoxManager init called, store is closed before init: ${_store?.isClosed()}');
//     if (_store != null && !_store!.isClosed()) {
//       log('ObjectBoxManager already initialized store $_store');
//       return;
//     }

//     try {
//       final appDocDir = await getApplicationDocumentsDirectory();
//       // final storeDir = join(CacheFlags.privateDocumentPath!, 'objectbox');
//       // final storeDir = join(CacheFlags.privateDocumentPath!, 'objectbox');

//       final storeDir =
//           join(appDocDir.path, 'device_users');
//       final userDir = Directory(storeDir);
//       await userDir.create(recursive: true);

//       _store = Store(getObjectBoxModel(), directory: storeDir);

//       userBox = Box<UserModel>(_store!);
   
   
//     } catch (e) {
//       log('Error ObjectBoxManager initializing ObjectBox: $e');
//     }
//     log('ObjectBoxManager init called, store is closed after init: ${_store?.isClosed()}');
//   }

//   static void close() {
//     if (_store != null) {
//       log('ObjectBoxManager closing store. Is store closed before close: ${_store!.isClosed()}');

//       if (!_store!.isClosed()) {
//         _store!.close();
//         log('ObjectBoxManager store closed');
//       } else {
//         log('ObjectBoxManager store is already closed');
//       }

//       _store = null; // Reset store to allow reinitialization
//     } else {
//       log('ObjectBoxManager store is already null or was not initialized');
//     }
//   }

//   // Add a getter for the store, to access it safely
//   static Store? get store {
//     if (_store == null || _store!.isClosed()) {
//       // throw StateError('Store is not initialized or has been closed');
//       log('ObjectBoxManager Store is not initialized or has been closed');
//       return null;
//     }
//     return _store!;
//   }
// }