import "package:bloc/bloc.dart";
import "package:expanse_app/constants.dart";
import "package:expanse_app/cubits/cubit/transaction_cubits/transaction_cubit.dart";
import "package:expanse_app/models/expanse_model.dart";
import "package:expanse_app/simple_bloc_observer.dart";
import "package:expanse_app/views/dashboard_view.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hive_flutter/hive_flutter.dart";

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ExpanseModelAdapter());
  Bloc.observer = SimpleBlocObserver();
  await Hive.openBox<ExpanseModel>(kExpanseBox);

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: DashboardView(),
      ),
    );
  }
}
