part of 'interest_bloc.dart';

@immutable
sealed class InterestState {}

final class InterestInitial extends InterestState {}

final class InterestSuccessState extends InterestState {
  List<String>? interests;
  InterestSuccessState({required this.interests});

  List<Object> get props => [interests!];
}

final class InterestFailureState extends InterestState {}

final class InterestLoadingState extends InterestState {}
