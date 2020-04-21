import 'package:flutter/material.dart';
import 'package:q_ours/extensions/hex_color.dart';
import 'package:q_ours/router.dart';
import 'package:q_ours/services/locator.dart';
import 'package:q_ours/services/navigation_service.dart';
import 'package:q_ours/widgets/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ViewContainer extends StatelessWidget {
  static GlobalKey<NavigationBarState> navBarKey = GlobalKey<NavigationBarState>();
  ViewContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                HexColor.fromHex('1A2A6C'),
                HexColor.fromHex('B21F1F'),
                HexColor.fromHex('FDBB2D')
              ])),
          child: Column(
            children: <Widget>[
              NavigationBar(key: navBarKey,),
              Expanded(
                  child: Navigator(
                initialRoute: '/',
                key: locator<NavigationService>().navKey,
                onGenerateRoute: generateRoute,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
