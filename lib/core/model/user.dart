// import 'package:investa4/core/utils/object_box_manager.dart';
// import 'package:investa4/objectbox.g.dart';

// @Entity()
// class UserModel {
//   @Id()
//   int id = 0; // ObjectBox ID, auto-incremented
//   String guid; // Unique identifier for the user, can be used for syncing

//   String username; // User's username
//   String email; // User's email address
//   DateTime? birthdate; // User's birthdate
//   bool signedUp; // Flag to indicate if the user has signed up

//   UserModel({
//     this.id = 0,
//     this.guid = '',
//     required this.username,
//     required this.email,
//     this.birthdate,
//     this.signedUp = false,
//   });
// }

// class UserMethods {
//   static UserModel? getSignedUser() {
//     // Fetch the signed-up user from the database
//     final query = ObjectBoxManager.userBox
//         .query(UserModel_.signedUp.equals(true))
//         .build();
//     final user = query.findUnique();
//     query.close();
//     return user; // Return an empty UserModel if not found
//   }

//   static removeSignedUser(UserModel user) {
//    user.signedUp = false; // Update signedUp status
//     ObjectBoxManager.userBox.put(user); // Save the updated user
//   }

//   // Create or Update user
//   static int saveUser(UserModel user) {
//     return ObjectBoxManager.userBox.put(user); // returns inserted/updated ID
//   }
// static updateUser(UserModel user) {
//     // Update user details
//     return ObjectBoxManager.userBox.put(user); // returns updated ID
//   }
//   // Read all users
//   static List<UserModel> getAllUsers() {
//     return ObjectBoxManager.userBox.getAll();
//   }

//   // Get user by ID
//   static UserModel? getUserById(int id) {
//     return ObjectBoxManager.userBox.get(id);
//   }

//   // Get user by GUID
//   static UserModel? getUserByGuid(String guid) {
//     final query =
//         ObjectBoxManager.userBox.query(UserModel_.guid.equals(guid)).build();
//     final user = query.findFirst();
//     query.close();
//     return user;
//   }

//   // Delete user by ID
//   static bool deleteUser(int id) {
//     return ObjectBoxManager.userBox.remove(id);
//   }

//   // Delete all users
//   static int deleteAllUsers() {
//     return ObjectBoxManager.userBox.removeAll();
//   }

//   // Update signedUp status
//   static bool updateSignUpStatus(int id, bool status) {
//     final user = ObjectBoxManager.userBox.get(id);
//     if (user != null) {
//       user.signedUp = status;
//       ObjectBoxManager.userBox.put(user);
//       return true;
//     }
//     return false;
//   }

//   // Search users by username
//   static List<UserModel> searchByUsername(String keyword) {
//     final query = ObjectBoxManager.userBox
//         .query(UserModel_.username.contains(keyword, caseSensitive: false))
//         .build();
//     final users = query.find();
//     query.close();
//     return users;
//   }
// }

import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:investa4/core/utils/hive_manage.dart';

part 'user.g.dart'; // Generated adapter

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  // 0: integer ID (auto‑increment)
  @HiveField(0)
  int id;

  // 1: GUID (still useful if you need a stable string key)
  @HiveField(1)
  String guid;

  // 2: username
  @HiveField(2)
  String username;

  // 3: email
  @HiveField(3)
  String email;

  // 4: birthdate
  @HiveField(4)
  DateTime? birthdate;

  // 5: signedUp flag
  @HiveField(5)
  bool signedUp;

  UserModel({
    this.id = 0,
    required this.guid,
    required this.username,
    required this.email,
    this.birthdate,
    this.signedUp = false,
  });
}

class UserMethods {
  // static Box<UserModel> get userBox => Hive.box<UserModel>('users');

  static UserModel? getSignedUser() {
    try {
      if (HiveManager.userBox.isEmpty) {
        return null; // No users signed up
      }
      return HiveManager.userBox.values.firstWhere(
        (user) => user.signedUp,
        // orElse: () => null,
      );
    } on Exception catch (e) {
      log('Error fetching signed user: $e');
      return null;
    }
  }

  static void removeSignedUser(UserModel user) {
    user.signedUp = false;
    user.save();
  }

  static Future<void> saveUser(UserModel user) async {
    await HiveManager.userBox.put(user.guid, user);
  }

  static Future<void> updateUser(UserModel user) async {
    await user.save();
  }

  static List<UserModel> getAllUsers() {
    return HiveManager.userBox.values.toList();
  }

  static UserModel? getUserById(int index) {
    return HiveManager.userBox.getAt(
      index,
    ); // Use index since Hive keys are dynamic
  }

  static UserModel? getUserByGuid(String guid) {
    return HiveManager.userBox.get(guid);
  }

  static Future<void> deleteUser(String guid) async {
    await HiveManager.userBox.delete(guid);
  }

  static Future<void> deleteAllUsers() async {
    await HiveManager.userBox.clear();
  }

  static Future<bool> updateSignUpStatus(String guid, bool status) async {
    final user = HiveManager.userBox.get(guid);
    if (user != null) {
      user.signedUp = status;
      await user.save();
      return true;
    }
    return false;
  }

  static List<UserModel> searchByUsername(String keyword) {
    return HiveManager.userBox.values
        .where(
          (user) => user.username.toLowerCase().contains(keyword.toLowerCase()),
        )
        .toList();
  }
}
