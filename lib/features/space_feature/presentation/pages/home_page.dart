import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/constants/constants.dart';
import 'package:space_app/features/space_feature/presentation/bloc/nasa_bloc.dart';
import 'package:space_app/features/space_feature/presentation/widgets/home_page_half.dart';
import 'package:space_app/injection_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SPACE EXPLORER'),
        ),
        body: buildBody(context),
    backgroundColor: kSecondaryColor,);
  }

  BlocProvider<NasaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => serviceLocator<NasaBloc>(),
      child: BlocListener<NasaBloc, NasaState>(
        listener: (context, state) {
          if (state is PicOfTheDayLoaded) {
          } else if (state is MarsPicLoaded) {}
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
            //const SizedBox(height: 16.0,),
            const HomePageHalf(),
          ],
        ),
      ),
    );
  }
}
