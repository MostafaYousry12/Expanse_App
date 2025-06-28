import "package:bloc/bloc.dart";
import "package:expanse_app/constants.dart";
import "package:expanse_app/models/expanse_model.dart";
import "package:expanse_app/simple_bloc_observer.dart";
import "package:expanse_app/views/dashboard_view.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hive_flutter/hive_flutter.dart";

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  await Hive.openBox<ExpanseModel>(kExpanseBox);
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: DashboardView(),
    );
  }
}
