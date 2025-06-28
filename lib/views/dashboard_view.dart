import 'package:expanse_app/constants.dart';
import 'package:expanse_app/widgets/appbar_widget.dart';
import 'package:expanse_app/widgets/dashboardview_body.dart';
import 'package:expanse_app/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: DashboardviewBody(),
    );
  }
}
