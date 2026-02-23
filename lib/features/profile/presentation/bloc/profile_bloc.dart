import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_my_profile.dart';
import '../../domain/usecases/update_profile.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetMyProfile getMyProfile;
  final UpdateProfile updateProfile;

  ProfileBloc(this.getMyProfile, this.updateProfile)
      : super(ProfileInitial()) {
    on<LoadMyProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        final profile = await getMyProfile();
        emit(ProfileLoaded(profile));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });

    on<SaveProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        final profile = await updateProfile(
          name: event.name,
          headline: event.headline,
          location: event.location,
          about: event.about,
        );
        emit(ProfileLoaded(profile));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });
  }
}