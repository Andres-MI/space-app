import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:space_app/features/space_feature/domain/entities/mars_picture.dart';
import 'package:space_app/features/space_feature/domain/repositories/nasa_repository.dart';
import 'package:space_app/features/space_feature/domain/use_cases/get_mars_picture_use_case.dart';
import 'get_mars_picture_test.mocks.dart';

class MockNasaRepository extends Mock implements NasaRepository {}

@GenerateMocks([MockNasaRepository])
void main() {
  late GetMarsPictureUseCase getMarsPictureUseCase;
  late MockMockNasaRepository mockNasaRepository;

  setUp(() {
    mockNasaRepository = MockMockNasaRepository();
    getMarsPictureUseCase = GetMarsPictureUseCase(mockNasaRepository);
  });

  const testCamera = 'FHAZ';
  const testPicture = MarsPicture(
      urlImage: 'http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG',
      earthDate: '2015-05-30');

  test(
    'retrieve Mars picture',
        () async {
      when(mockNasaRepository.getMarsPicture(cameraType: anyNamed('cameraType')))
          .thenAnswer((_) async => const Right(testPicture));

      final result = await getMarsPictureUseCase(const MarsPictureParams(cameraType: testCamera));

      expect(result, const Right(testPicture));
      verify(mockNasaRepository.getMarsPicture(cameraType: testCamera));
      verifyNoMoreInteractions(mockNasaRepository);
    },
  );
}
