import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';
import 'package:ilmnur_app/core/resources/state_status.dart';
import 'package:ilmnur_app/features/profile/data/models/profile.dart';
import 'package:ilmnur_app/features/profile/domain/repositories/profile_repo.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo profileRepo;
  int activeTabIndex = 0;
  late Profile profile;
  late int id;

  ProfileBloc({required this.profileRepo, required this.id})
    : super(ProfileInitial()) {
    on<GetProfiles>((event, emit) async {
      emit(Loading());
      try {
        final response = await profileRepo.getProfile(id);
        if (response is DataSuccess) {
          Profile? profile = response.data;
          if (profile != null) {
            emit(
              LoadedProfileData(profile: profile, status: StateStatus.loaded),
            );
          } else {
            emit(const ErrorLoadingProfileData("Failed to load profile data"));
          }
        }
      } catch (e) {
        final errorMessage = 'Failed to load profile data: $e';
        emit(ErrorLoadingProfileData(errorMessage));
      }
    });

    add(GetProfiles());
  }
}
