import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

class UpdateProfile {
  final ProfileRepository repository;

  UpdateProfile(this.repository);

  Future<Profile> call({
    required String name,
    required String headline,
    required String location,
    required String about,
  }) {
    return repository.updateProfile(
      name: name,
      headline: headline,
      location: location,
      about: about,
    );
  }
}