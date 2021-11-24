import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:space_app/core/error/exception.dart';
import 'package:space_app/core/service/network_utils.dart';
import 'package:space_app/core/service/url_const.dart';
import 'package:space_app/features/space_feature/data/models/mars_picture_model.dart';
import 'package:space_app/features/space_feature/data/models/picture_of_the_day_model.dart';

abstract class NasaRemoteDataSource {
  Future<PictureOfTheDayModel> getPictureOfTheDay();

  Future<MarsPictureModel> getMarsPicture(String cameraType);
}

class NasaRemoteDataSourceImpl implements NasaRemoteDataSource {
  Dio client;

  NasaRemoteDataSourceImpl({required this.client});

  @override
  Future<MarsPictureModel> getMarsPicture(String cameraType) async {
    client = NetworkUtils.attachDefaultInterceptors(client);
    late Response response;
    try {
      response = await client
          .get(UrlConstants.marsPicture.replaceFirst('{cameraType}', cameraType));
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error Retrieving Mars Picture: ' + e.toString());
      }
    }
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.toString());

      MarsPictureModel marsPictureModel = MarsPictureModel.fromJson(responseData);
      return marsPictureModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PictureOfTheDayModel> getPictureOfTheDay() async {
    client = NetworkUtils.attachDefaultInterceptors(client);
    late Response response;
    try {
      response = await client.get(UrlConstants.pictureOfTheDay);
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error Retrieving Picture of the day: ' + e.toString());
      }
    }
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.toString());

      PictureOfTheDayModel pictureOfTheDayModel = PictureOfTheDayModel.fromJson(responseData);
      return pictureOfTheDayModel;
    } else {
      throw ServerException();
    }
  }
}
