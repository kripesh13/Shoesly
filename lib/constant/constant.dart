import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SizedBox kSizedBox() => SizedBox(
      height: 10,
    );
SizedBox MSizedBox() => SizedBox(
      height: 15,
    );
SizedBox LSizedBox() => SizedBox(
      height: 20,
    );

SizedBox sSizedBox() => SizedBox(
      height: 5,
    );
SizedBox minWidthSpan() => const SizedBox(
      width: 5,
    );
SizedBox maxWidthSpan() => const SizedBox(
      width: 10,
    );
SizedBox largeWidthSpan() => const SizedBox(
      width: 20,
    );

EdgeInsets kStandardPadding() =>
    const EdgeInsets.symmetric(horizontal: 20, vertical: 10);

EdgeInsets kPadding() => const EdgeInsets.all(10);
EdgeInsets kVerticalPadding() => const EdgeInsets.symmetric(vertical: 10);
EdgeInsets kHorizontalPadding() => const EdgeInsets.symmetric(horizontal: 10);

showLogoutConfirmationDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
              // insetPadding: EdgeInsets.zero,
              title: Text('Log Out!', style: kBoldTextStyle()),
              content: const Text('Are you sure you want to logout?'),

              actions: <Widget>[
                TextButton(
                  child: Text(
                    "Cancel",
                    style: kTextStyle().copyWith(color: Colors.grey),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                // TextButton(
                //     child: Text(
                //       'Log Out',
                //       style: kTextStyle().copyWith(color: primaryColor),
                //     ),
                // onPressed: () async {
                //   LocalStorageService().clear(LocalStorageKeys.accessToken);

                //   Navigator.pop(context);
                //   Navigator.pushNamedAndRemoveUntil(
                //       context, LoginScreen.id, (route) => false);
                //   // isLoggedIn = false;
                // }),
              ],
            );
          },
        );
      });
}

showDeleteCartConfirmationDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
              // insetPadding: EdgeInsets.zero,
              title: Text('Delete from Cart!', style: kBoldTextStyle()),
              content: const Text('Are you sure you want to delete this item?'),

              actions: <Widget>[
                TextButton(
                  child: Text(
                    "Cancel",
                    style: kTextStyle().copyWith(color: Colors.grey),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                // TextButton(
                //     child: Text(
                //       'Delete',
                //       style: kTextStyle().copyWith(color: primaryColor),
                //     ),
                //     onPressed: () async {
                //       // Navigator.pop(context);
                //       // Navigator.pop(context);
                //       ToastService().s('Successfully Deleted!');
                //       // Navigator.pushNamedAndRemoveUntil(context, .id, (route) => false,);

                //       Navigator.pushNamed(context, HomeDisplay.id,
                //           arguments: 'cart ma puryaidey');

                //       // Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false,);
                //     }),
              ],
            );
          },
        );
      });
}

Future<T?> showTopModalSheet<T>(BuildContext context, Widget child,
    {bool barrierDismissible = true}) {
  return showGeneralDialog<T?>(
    context: context,
    barrierDismissible: barrierDismissible,
    transitionDuration: const Duration(milliseconds: 250),
    barrierLabel: MaterialLocalizations.of(context).dialogLabel,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (context, _, __) => child,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        child: Column(
          children: [
            Material(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [child],
              ),
            )
          ],
        ),
        position: CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)
            .drive(
                Tween<Offset>(begin: const Offset(0, -1.0), end: Offset.zero)),
      );
    },
  );
}

bool isMobileView = true;
bool isTabView = true;

BoxConstraints? appConstraints;
AppBar defaultAppBar(String title) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: kkWhiteBoldTextStyle(),
    ),
    backgroundColor: primaryColor,
  );
}

TextStyle kTextStyle() => TextStyle(
      fontFamily: 'Hanken',
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    );

TextStyle kkTextStyle() => TextStyle(
      // color: Colors.grey[800],
      color: Colors.black,
      fontFamily: 'Hanken',

      fontSize: 16,
    );

TextStyle kUnderline() => GoogleFonts.urbanist(
      color: Colors.grey[800],
      decoration: TextDecoration.lineThrough,
      fontSize: 11,
    );

TextStyle sTextStyle() => GoogleFonts.urbanist(
      color: Colors.grey[800],
      fontSize: 10,
    );

TextStyle kBoldTextStyle() => GoogleFonts.urbanist(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );

TextStyle kWhiteBoldTextStyle() => GoogleFonts.urbanist(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );

TextStyle kWhiteTextStyle() => GoogleFonts.urbanist(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
TextStyle sWhiteTextStyle() => GoogleFonts.urbanist(
      color: Colors.white,
      fontSize: 10,
      fontWeight: FontWeight.w400,
    );
TextStyle kkBoldTextStyle() => GoogleFonts.urbanist(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

TextStyle kkWhiteBoldTextStyle() => GoogleFonts.urbanist(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

TextStyle tabsTextStyle() => GoogleFonts.urbanist(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    );

TextStyle sBoldTextStyle() => GoogleFonts.urbanist(
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );

Color primaryColor = Color(0xFF283891).withOpacity(0.96);
Color secondaryColor = Color(0xFF58A854).withOpacity(0.96);

Color blueColor = Color(0xff1A469D);
Color darkGrey = Color.fromARGB(255, 14, 14, 15);
Color greyColor = Color.fromARGB(255, 219, 218, 218);
Color yellowColor = Color(0xffFFCF01);
Color errorColor = Colors.red;
Color whiteColor = Colors.white;
Color redColor = Colors.red;
Color amberColor = Colors.amber;
//#E5283C

Color successColor = Colors.green;

const kBottomContainerHeight = 80.0;
const kActiveCardColour = Color.fromARGB(255, 70, 72, 107);
const kInactiveCardColour = Color(0xFF111328);
const kBottomContainerColour = Color.fromARGB(255, 248, 0, 74);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color.fromARGB(255, 42, 42, 44),
);

const kNumberTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);

// String base_url = 'https://elabnepal.com/api/v1';
String base_url = 'https://tourbooking-production.up.railway.app/api/v1';
