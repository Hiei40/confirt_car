abstract class DoctorsState {}

final class DoctorsInitial extends DoctorsState {}
class DoctorsClincLoading extends DoctorsState {}
class DoctorsClincSuccful extends DoctorsState {}
class DoctorsClincError extends DoctorsState {
  final String Erorr;

  DoctorsClincError({required this.Erorr});


}
class CollectionGroupDataLoading extends DoctorsState {}
class CollectionGroupDataSucful extends DoctorsState {}

