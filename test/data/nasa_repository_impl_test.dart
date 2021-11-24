import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:space_app/features/space_feature/data/data_sources/nasa_local_data_source.dart';
import 'package:space_app/features/space_feature/data/data_sources/nasa_remote_data_source.dart';
import 'package:space_app/features/space_feature/data/repositories/nasa_repository_impl.dart';

class MockRemoteDataSource extends Mock implements NasaRemoteDataSource{}
class MockLocalDataSource extends Mock implements NasaLocalDataSource{}

@GenerateMocks([MockRemoteDataSource, MockLocalDataSource])
void main() {
  late NasaRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;

  setUp((){
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    repository = NasaRepositoryImpl(localDataSource: mockLocalDataSource, remoteDataSource: mockRemoteDataSource);
  });

}