import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/application/Option_Bloc/option_bloc.dart';
import 'package:cinefy/application/artist_profile_bloc/artist_profile_bloc.dart';
import 'package:cinefy/application/create_cc_bloc/bloc/create_cc_bloc.dart';
import 'package:cinefy/application/ui_bloc/ui_bloc.dart';
import 'package:cinefy/core/colors.dart';
import 'package:cinefy/domain/timer/timer_cubit.dart';
import 'package:cinefy/presentation/splash%20screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'application/bloc_user/user_bloc.dart';
import 'application/drop_down_bloc/drop_down_bloc.dart';
import 'application/login_bloc/login_bloc.dart';
import 'application/sign_up_bloc/sign_up_bloc.dart';
import 'infrastructure/Models/current_user.dart';

Future<void> main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CurrentUserModelAdapter().typeId)) {
    Hive.registerAdapter(CurrentUserModelAdapter());
  }

  runApp(const MyApp());

  // Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  // Hive.init(directory.path);
  // Hive.registerAdapter(CurrentUserAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginBloc()),
          BlocProvider(create: (context) => UserBloc()),
          BlocProvider(create: (context) => SignUpBloc()),
          BlocProvider(create: (context) => CastingCallBloc()),
          BlocProvider(create: (context) => DropDownBloc()),
          BlocProvider(create: (context) => OptionBloc()),
          BlocProvider(create: (context) => ArtistProfileBloc()),
          BlocProvider(create: (context) => CreateCcBloc()),
          BlocProvider(create: (context) => UiBloc()),
          BlocProvider(create: (context) => TimerCubit()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              focusColor: shade1,
              primarySwatch: Colors.blue,
              fontFamily: 'PoppinsRegular',
              scaffoldBackgroundColor: primaryColor),
          home: const SplashScreen(),
        ));
  }
}
