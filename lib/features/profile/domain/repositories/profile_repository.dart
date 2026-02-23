import '../entities/profile.dart';

abstract class ProfileRepository {
  Future<Profile> getMyProfile();
  Future<Profile> updateProfile({
    required String name,
    required String headline,
    required String location,
    required String about,
  });
}