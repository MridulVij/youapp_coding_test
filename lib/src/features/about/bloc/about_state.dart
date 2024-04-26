part of 'about_bloc.dart';

class AboutState {}

final class AboutInitial extends AboutState {}

final class AboutLoadingStateAfterClickingSaveAndEditButton
    extends AboutState {}

final class ShowCustomAboutFieldNotEmpty extends AboutState {}

final class AboutSuccessState extends AboutState {
  final Data data;
  AboutSuccessState(this.data);
  @override
  List<Object> get props => [data];
}

final class AboutFailureState extends AboutState {}
