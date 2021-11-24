// Mocks generated by Mockito 5.0.16 from annotations
// in space_app/test/data/nasa_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:space_app/features/space_feature/data/models/mars_picture_model.dart'
    as _i3;
import 'package:space_app/features/space_feature/data/models/picture_of_the_day_model.dart'
    as _i2;

import 'nasa_repository_impl_test.dart' as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakePictureOfTheDayModel_0 extends _i1.Fake
    implements _i2.PictureOfTheDayModel {}

class _FakeMarsPictureModel_1 extends _i1.Fake implements _i3.MarsPictureModel {
}

/// A class which mocks [MockRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockRemoteDataSource extends _i1.Mock
    implements _i4.MockRemoteDataSource {
  MockMockRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String toString() => super.toString();
  @override
  _i5.Future<_i2.PictureOfTheDayModel> getPictureOfTheDay() =>
      (super.noSuchMethod(Invocation.method(#getPictureOfTheDay, []),
              returnValue: Future<_i2.PictureOfTheDayModel>.value(
                  _FakePictureOfTheDayModel_0()))
          as _i5.Future<_i2.PictureOfTheDayModel>);
  @override
  _i5.Future<_i3.MarsPictureModel> getMarsPicture(String? cameraType) =>
      (super.noSuchMethod(Invocation.method(#getMarsPicture, [cameraType]),
              returnValue:
                  Future<_i3.MarsPictureModel>.value(_FakeMarsPictureModel_1()))
          as _i5.Future<_i3.MarsPictureModel>);
}

/// A class which mocks [MockLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockLocalDataSource extends _i1.Mock
    implements _i4.MockLocalDataSource {
  MockMockLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String toString() => super.toString();
  @override
  _i5.Future<_i2.PictureOfTheDayModel> getCachedPicture() =>
      (super.noSuchMethod(Invocation.method(#getCachedPicture, []),
              returnValue: Future<_i2.PictureOfTheDayModel>.value(
                  _FakePictureOfTheDayModel_0()))
          as _i5.Future<_i2.PictureOfTheDayModel>);
  @override
  _i5.Future<void> cachePicture(_i2.PictureOfTheDayModel? pictureToCache) =>
      (super.noSuchMethod(Invocation.method(#cachePicture, [pictureToCache]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
}
