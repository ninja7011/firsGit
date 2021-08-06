abstract class NewsState {}

class NewsInitialState extends NewsState {}
class NewsBottomNavState extends NewsState {}
class NewsGetBusinessSuccessState extends NewsState{}
class NewsGetBusinessLoadingState extends NewsState{}
class NewsGetBusinessErrorState extends NewsState{
  final String error ;

  NewsGetBusinessErrorState(this.error);
}


class NewsGetSportsSuccessState extends NewsState{}
class NewsGetSportsLoadingState extends NewsState{}
class NewsGetSportsErrorState extends NewsState{
  final String error ;

  NewsGetSportsErrorState(this.error);
}


class NewsGetScienceSuccessState extends NewsState{}
class NewsGetScienceLoadingState extends NewsState{}
class NewsGetScienceErrorState extends NewsState{
  final String error ;

  NewsGetScienceErrorState(this.error);
}






class NewsGetSearchSuccessState extends NewsState{}
class NewsGetSearchLoadingState extends NewsState{}
class NewsGetSearchErrorState extends NewsState{
  final String error ;

  NewsGetSearchErrorState(this.error);
}