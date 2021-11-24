import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/error/exception.dart';
import 'package:space_app/features/space_feature/data/models/picture_of_the_day_model.dart';

abstract class NasaLocalDataSource {
  Future<PictureOfTheDayModel> getCachedPicture();

  Future<void> cachePicture(PictureOfTheDayModel pictureToCache);
}

const IMAGE_CACHED = 'IMAGE_CACHED';

class NasaLocalDataSourceImpl implements NasaLocalDataSource {
  final SharedPreferences sharedPreferences;

  NasaLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cachePicture(PictureOfTheDayModel pictureToCache) {
    return sharedPreferences.setString(
        IMAGE_CACHED, json.encode(pictureToCache.toJson()));
  }

  @override
  Future<PictureOfTheDayModel> getCachedPicture() {
    final jsonString = sharedPreferences.getString(IMAGE_CACHED);
    if (jsonString != null) {
      return Future.value(PictureOfTheDayModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
