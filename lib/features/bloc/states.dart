abstract class HomeStates{}

class HomeInitState extends HomeStates{}


class HomeGetSourcesSuccessState extends HomeStates{}
class HomeGetSourcesLoadingState extends HomeStates{}
class HomeGetSourcesErrorState extends HomeStates{}

class HomeGetNewsDataSuccessState extends HomeStates{}
class HomeGetNewsDataLoadingState extends HomeStates{}
class HomeGetNewsDataErrorState extends HomeStates{}
class HomeChangeSource extends HomeStates{}
class HomeChangeCategory extends HomeStates{}
class SearchLoadingState extends HomeStates{}
class SearchSuccessState extends HomeStates{}
class SearchErrorState extends HomeStates{}
class HomeDrawerChange extends HomeStates{}