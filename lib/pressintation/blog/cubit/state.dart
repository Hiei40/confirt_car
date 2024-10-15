abstract class BlogMainState {}

class BlogInitState extends BlogMainState {}

class CountState extends BlogMainState {}
class FilePickedState extends BlogMainState {}
class FilePickErrorState extends BlogMainState {}
class BlogAddedState extends BlogMainState {}
class BlogUploadErrorState extends BlogMainState {}
class FilePickCancelledState extends BlogMainState {}

class BlogInitial extends BlogMainState {}

class BlogLoading extends BlogMainState {}

class BlogSuccess extends BlogMainState {}

class BlogError extends BlogMainState {
  final String message;
  BlogError(this.message);
}





