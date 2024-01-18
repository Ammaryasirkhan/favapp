import 'package:fav_app/blocs/bloc/fav_screen_bloc.dart';
import 'package:fav_app/pages/fav_repo_list.dart';
import 'package:fav_app/pages/fav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => FavScreenBloc(FavRepo()))],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: const MyFavScreen(),
      ),
    );
  }
}
