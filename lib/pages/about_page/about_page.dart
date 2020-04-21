import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:q_ours/widgets/title_text.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: <Widget>[
            TitleText('About'),
            Center(
              child: Wrap(children: [
                Container(
                  width: 1000,
                  child: FadeInUp(
                    delay: Duration(milliseconds: 500),
                    duration: Duration(seconds: 2),
                    child: Card(
                      elevation: 6,
                      color: Colors.white.withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.all(40),
                        child: Text(
                          'QOurs was designed so that users could create their own QR codes quickly and easily with minimal hassle. We hoped to create an app that would help small business owners as well as single users to get their business/product out into the world easier.\n\nWhether using the free service or one of our paid tiers, all QOurs users have access to our Code Creator. We specifically designed the interface to be very simple, so that there were no obstacles for users to create their codes. Once you’ve designed your code, you can attach any URL you want to it, whether it’s to your business’s website, your Ebay store, or anything else. We hope that you’ll enjoy using our app.\n\nSincerely, \nThe QOurs team ',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
