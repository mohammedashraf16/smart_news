
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart'as http;
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/features/bloc/states.dart';
import 'package:news_app/features/home/data/models/NewsDataResponse.dart';
import 'package:news_app/features/home/data/models/SourceResponse.dart';

import '../categories/presentation/data/models/category_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);
  SourceResponse? sourceResponse;
  NewsDataResponse? newsDataResponse;
  int selectedTapIndex = 0;
  CategoryModel? categoryModel;
  Future<void> getResponse(String id) async {
    try {
      emit(HomeGetSourcesLoadingState());
      // https://newsapi.org/v2/top-headlines/sources?apiKey=6cbceab66344435ea098ed3cbd13fe56
      //https://newsapi.org/v2/everything?q=bitcoin&apiKey=6cbceab66344435ea098ed3cbd13fe56
      // authority => baseUrl
      // unencodedPath => endpoint
      Uri url = Uri.https(Constants.baseUrl, Constants.endPoint, {
        "apiKey": Constants.apiKey,
        "category": id,
      });
      http.Response response = await http.get(url);
      Map<String, dynamic> jsonFormat = jsonDecode(response.body);
       sourceResponse = SourceResponse.fromJson(jsonFormat);
      emit(HomeGetSourcesSuccessState());
      getNewsData(
          sourceId: sourceResponse?.sources?[selectedTapIndex].id ?? "");
    } catch (e) {
      emit(HomeGetSourcesErrorState());
    }
  }

  Future<void> getNewsData({String? sourceId, String? query}) async {
    try {
      emit(HomeGetNewsDataLoadingState());

      Uri url = Uri.https(Constants.baseUrl, Constants.endPointNews, {
        "sources": sourceId,
        "q": query,
      });
      http.Response response = await http.get(url, headers: {
        "x-api-key": Constants.apiKey,
      });
      var json = jsonDecode(response.body);
      newsDataResponse = NewsDataResponse.fromJson(json);
   this.newsDataResponse=newsDataResponse;
      emit(HomeGetNewsDataSuccessState());
    } catch (e) {
      emit(HomeGetNewsDataErrorState());
    }
  }

  changeSource(int value) {
    selectedTapIndex = value;
    emit(HomeChangeSource());
  }
}
