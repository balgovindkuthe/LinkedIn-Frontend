import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

class GetMyProfile {
  final ProfileRepository repository;

  GetMyProfile(this.repository);

  Future<Profile> call() {
    return repository.getMyProfile();
  }
}