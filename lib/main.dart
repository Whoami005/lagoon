import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lagoon/repositories/posts_repository.dart';
import 'package:lagoon/screens/home/bloc/home_cubit.dart';
import 'package:lagoon/screens/home/home_screen.dart';
import 'package:lagoon/theme/colors.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async {
  timeago.setLocaleMessages('ru', timeago.RuMessages());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PostsRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(postsRepository: PostsRepository()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: LagoonColors.white),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
