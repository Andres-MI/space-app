import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:space_app/core/usecases/usecase.dart';
import 'package:space_app/features/space_feature/domain/entities/picture_of_the_day.dart';
import 'package:space_app/features/space_feature/domain/repositories/nasa_repository.dart';
import 'package:space_app/features/space_feature/domain/use_cases/get_picture_of_the_day_use_case.dart';
import 'get_picture_of_the_day_test.mocks.dart';

class MockNasaRepository extends Mock implements NasaRepository {}

@GenerateMocks([MockNasaRepository])
void main() {
  late GetPictureOfTheDayUseCase pictureOfTheDayUseCase;
  //GetMarsPicture getMarsPictureUseCase;
  late MockMockNasaRepository mockNasaRepository;

  setUp(() {
    mockNasaRepository = MockMockNasaRepository();
    pictureOfTheDayUseCase = GetPictureOfTheDayUseCase(mockNasaRepository);
    //getMarsPictureUseCase = GetMarsPictureUseCase(mockNasaRepository);
  });

  final testPicture = PictureOfTheDay(
      title: 'Picture of today',
      url: 'https://apod.nasa.gov/apod/image/2111/PleiadesB_Cannane_960.jpg');

  test(
    'retrieve Astronomical Picture Of The Day',
    () async {
      when(mockNasaRepository.getPictureOfTheDay())
          .thenAnswer((_) async => Right(testPicture));

      final result = await pictureOfTheDayUseCase(NoParams());

      expect(result, Right(testPicture));
      verify(mockNasaRepository.getPictureOfTheDay());
      verifyNoMoreInteractions(mockNasaRepository);
    },
  );
}
