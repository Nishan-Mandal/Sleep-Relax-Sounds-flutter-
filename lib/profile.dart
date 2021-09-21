import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  feedback_HelpSupportByEmail(
      String toEmail, String subject, String body) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchUrl(String urlLink) async {
    final url = urlLink;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  rateUs() {
    double ratingStars = 0;
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          height: 300,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("appLogo.png"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Enjoying Sleep Relax Sounds?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                  Text("Tap a star to rate it on the"),
                  Text("Play Store."),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    thickness: 1,
                    height: 6,
                  ),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 0,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        ratingStars = rating;
                      });
                    },
                  ),
                  Divider(
                    thickness: 1,
                    height: 6,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                    onTap: () {
                      if (ratingStars > 2) {
                        StoreRedirect.redirect(
                          androidAppId: "com.iyaffle.rangoli",
                        );
                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Thanks"),
                      ));
                    },
                  )
                ],
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Colors.orange,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
      child: Scaffold(
          floatingActionButton: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 30),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('stars.jpg'), fit: BoxFit.fill)),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                // Container(
                //   width: double.infinity,
                //   padding: EdgeInsets.all(20),
                //   color: Colors.cyan,
                //   child: Column(
                //     children: [
                //       Container(
                //         margin: EdgeInsets.only(top: 20),
                //         width: 120,
                //         height: 200,
                //         decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             image: DecorationImage(
                //                 image: AssetImage('stars.jpg'), fit: BoxFit.fill)),
                //       ),
                //     ],
                //   ),
                // ),
                Divider(
                  color: Colors.grey,
                  height: 0,
                ),
                ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text(
                    "Feedback",
                    style: TextStyle(fontSize: 17),
                  ),
                  onTap: () => feedback_HelpSupportByEmail(
                      'ultimaterocker1994@gmail.com', 'Feedback', ""),
                ),
                Divider(
                  color: Colors.grey,
                  height: 0,
                ),
                ListTile(
                  leading: Icon(Icons.rate_review),
                  title: Text(
                    "Rate Us",
                    style: TextStyle(fontSize: 17),
                  ),
                  onTap: () => rateUs(),
                ),
                Divider(
                  color: Colors.grey,
                  height: 0,
                ),
                ListTile(
                    leading: Icon(Icons.policy),
                    title: Text(
                      "Privacy Policy",
                      style: TextStyle(fontSize: 17),
                    ),
                    onTap: () => launchUrl(
                        "https://ultimaterocker1994.blogspot.com/p/privacy-policy-sleep-relax-sounds.html")),
                Divider(
                  height: 0,
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(Icons.library_books),
                  title: Text(
                    "Terms & Conditions",
                    style: TextStyle(fontSize: 17),
                  ),
                  onTap: () => launchUrl(
                      "https://ultimaterocker1994.blogspot.com/p/terms-conditions-sleep-relax-sounds.html"),
                ),
                Divider(
                  height: 0,
                  color: Colors.grey,
                ),
              ],
            ),
          )),
    );
  }
}
