part of 'global_cubit.dart';

sealed class GlobalState {}

final class GlobalInitial extends GlobalState {}

final class ChangeLangLoading extends GlobalState {}

final class ChangeLangSuccess extends GlobalState {}
