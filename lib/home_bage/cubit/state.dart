abstract class ClincsState {}
class InitMainState extends ClincsState{}
class  ProfileState extends ClincsState{}
class  MyProfileState extends ClincsState{}
class  EmptyState extends ClincsState{}
class  ClinicLoadinState extends ClincsState{}
class  ClinicSuccfulState extends ClincsState{}

class  ClinicErrorState extends ClincsState{
  final String Error;

  ClinicErrorState({required this.Error});


}
