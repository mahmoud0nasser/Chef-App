sealed class MenuState {}

final class MenuInitial extends MenuState {}

final class ChangeItemState extends MenuState {}

final class ChangeGroupState extends MenuState {}

final class AddDishLoadingState extends MenuState {}

final class AddDishSuccessState extends MenuState {}

final class AddDishErrorState extends MenuState {}

final class DeleteDishLoadingState extends MenuState {}

final class DeleteDishSuccessState extends MenuState {}

final class DeleteDishErrorState extends MenuState {}

final class GetAllChefMealsLoadingState extends MenuState {}

final class GetAllChefMealsSuccessState extends MenuState {}

final class GetAllChefMealsErrorState extends MenuState {}

final class TakeimageFromUser extends MenuState {}
