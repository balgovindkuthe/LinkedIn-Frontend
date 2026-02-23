import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDatasource remote;

  ProfileRepositoryImpl(this.remote);

  @override
  Future<Profile> getMyProfile() async {
    final res = await remote.getMyProfile();
    return Profile(
      userId: res.userId,
      name: res.name,
      headline: res.headline,
      location: res.location,
      profileImageUrl: res.profileImageUrl,
      about: res.about,
    );
  }

  @override
  Future<Profile> updateProfile({
    required String name,
    required String headline,
    required String location,
    required String about,
  }) async {
    final res = await remote.updateProfile({
      "name": name,
      "headline": headline,
      "location": location,
      "about": about,
    });

    return Profile(
      userId: res.userId,
      name: res.name,
      headline: res.headline,
      location: res.location,
      profileImageUrl: res.profileImageUrl,
      about: res.about,
    );
  }
}