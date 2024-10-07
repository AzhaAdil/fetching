import 'package:bloc/bloc.dart';
import 'package:fetching/state.dart';

import 'Repo.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository photoRepository;
  PhotoBloc(this.photoRepository) : super(PhotoInitial()){

    on<FetchPhotos>((event, emit) async {
      emit(PhotoLoading());

      try {
        // Simulating data fetching
        final user = await photoRepository.fetchPhotos();
        emit(PhotoLoaded(user));
      } catch (e) {
        emit(PhotoError('Failed to fetch user data'));
      }
    });
  }
}
