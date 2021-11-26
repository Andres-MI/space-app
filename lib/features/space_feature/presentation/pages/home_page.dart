import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/constants/constants.dart';
import 'package:space_app/core/enum/camera_type.dart';
import 'package:space_app/features/space_feature/presentation/bloc/nasa_bloc.dart';
import 'package:space_app/features/space_feature/presentation/pages/page_a.dart';
import 'package:space_app/features/space_feature/presentation/pages/page_b.dart';
import 'package:space_app/injection_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NasaBloc nasaBloc = serviceLocator<NasaBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SPACE EXPLORER'),
      ),
      body: buildBody(context),
      backgroundColor: kSecondaryColor,
    );
  }

  BlocProvider<NasaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => nasaBloc,
      child: BlocListener<NasaBloc, NasaState>(
        listener: (context, state) {
          if (state is PicOfTheDayLoaded) {
            Navigator.of(context)
                .pushNamed(PageA.screenId, arguments: state.pictureOfTheDay);
          } else if (state is MarsPicLoaded) {
            Navigator.of(context).pushNamed(PageB.screenId);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //const SizedBox(height: 16.0,),
            // BlocBuilder<NasaBloc, NasaState>(builder: (context, state) {
            //   if (state is NasaInitial) {
            //     return Container();
            //   } else if (state is NasaLoading) {
            //     return LoadingWidget();
            //   } else if (state is PicOfTheDayLoaded) {
            //     return Container();
            //   } else if (state is MarsPicLoaded) {
            //     return Container();
            //   } else if (state is NasaError) {
            //     return Container();
            //   } else{
            //     return Container();
            //   }
            // },
            // ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.all(16.0),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Pic of the day',
                            style: TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: kBasicColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onTap: () => dispatchGetPictureOfTheDay(),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.all(16.0),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Mars Picture',
                            style: TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: kBasicColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onTap: () => dispatchGetMarsPicture(cameraType: CameraType.NAVCAM),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void dispatchGetPictureOfTheDay() {
    nasaBloc.add(GetPictureOfTheDayEvent());
  }

  void dispatchGetMarsPicture({required CameraType cameraType}) {
    nasaBloc.add(GetMarsPictureEvent(cameraType: cameraType));
  }
}
