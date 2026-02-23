abstract class ProfileEvent {}

class LoadMyProfile extends ProfileEvent {}

class SaveProfile extends ProfileEvent {
  final String name;
  final String headline;
  final String location;
  final String about;

  SaveProfile({
    required this.name,
    required this.headline,
    required this.location,
    required this.about,
  });
}