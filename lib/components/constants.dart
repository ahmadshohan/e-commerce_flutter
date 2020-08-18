import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fashinshop/auth/auth_page.dart';
import 'package:fashinshop/welcome_page.dart';

final kTextStyleTextFormField = const TextStyle(
  color: Colors.black,
);
final kTextStyleHintFormField = const TextStyle(
  color: Color(0xFFC8C8C8),
  fontSize: 15,
);
final kTextStyle = const TextStyle(color: Color(0xFFCCCCCC), fontSize: 15);
final kTextFormFieldEmailDecoration = InputDecoration(
    hintText: "البريد الالكتروني",
    hintStyle: kTextStyleHintFormField,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide.none),
    filled: true,
    fillColor: Color(0xFFF5F5F5));
final kTextFormFieldNameDecoration = InputDecoration(
  hintText: "الاسم الكامل",
  hintStyle: kTextStyleHintFormField,
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide.none),
  filled: true,
  fillColor: Color(0xFFF5F5F5),
);
final kTextFormFieldPhoneNumberDecoration = InputDecoration(
  hintText: "رقم الموبايل",
  hintStyle: TextStyle(
    color: Color(0xFFC8C8C8),
    fontSize: 13,
  ),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide.none),
  filled: true,
  fillColor: Color(0xFFF5F5F5),
);
final kTextFormFieldPasswordDecoration = InputDecoration(
    hintText: "كلمة المرور",
    hintStyle: TextStyle(
      color: Color(0xFFC8C8C8),
      fontSize: 13,
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide.none),
    filled: true,
    fillColor: Color(0xFFF5F5F5));
final kTextFormFieldPasswordConfirmationDecoration = InputDecoration(
    hintText: "تأكيد كلمة المرور",
    hintStyle: TextStyle(
      color: Color(0xFFC8C8C8),
      fontSize: 13,
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide.none),
    filled: true,
    fillColor: Color(0xFFF5F5F5));
final kSizedBoxHight5 = const SizedBox(
  height: 5,
);
final kSizedBoxHight10 = const SizedBox(
  height: 10,
);
final kSizedBoxHight15 = const SizedBox(
  height: 15,
);
final kSizedBoxHight20 = const SizedBox(
  height: 20,
);
final kSizedBoxHight30 = const SizedBox(
  height: 30,
);
final kSizedBoxHight40 = const SizedBox(
  height: 40,
);
final kSizedBoxHight50 = const SizedBox(
  height: 50,
);
final kSizedBoxWidth4 = const SizedBox(
  width: 4,
);
final kSizedBoxWidth7 = const SizedBox(
  width: 7,
);
final kSizedBoxWidth15 = SizedBox(
  width: 15,
);
final kSizedBoxWidth10 = const SizedBox(
  width: 10,
);

final kSpinkit = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
);
void showErrorDialog(String message, BuildContext context) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: Text(
              'An Error occured !',
              style: TextStyle(color: Colors.red),
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text('Okay'),
              )
            ],
          ));
}

Future<bool> showConfirmDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: Text(
              'Are you sure?',
              style: TextStyle(color: Colors.red),
            ),
            content: Text('Do you want to remove the item from the cart?'),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                shape: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: Text(
                  'Yes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              FlatButton(
                color: Colors.black12,
                shape: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: Text(
                  'No',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ));
}

Future<bool> showSuccessDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: Text(
              'Success order',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w700,
              ),
            ),
            content: Text(
              'Your order has been successfully added',
            ),
          ));
}

Future<bool> showSignInDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: Text(
              'Attention',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w700,
              ),
            ),
            content: Text(
              'You must sign in to be able to order!',
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                shape: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(AuthPage.routeName);
                },
                child: Text(
                  'Signin',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              FlatButton(
                color: Colors.black12,
                shape: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  Navigator.of(ctx).pushReplacementNamed(WelcomePage.routeName);
                },
                child: Text(
                  'Exit',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ));
}

Future<bool> showExitConfirmationDialog(BuildContext context) async {
  return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Are you sure?',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: Text('Do you want to exit an App'),
          actions: <Widget>[
            FlatButton(
              color: Colors.red,
              shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                SystemNavigator.pop();
                Navigator.of(context).pop(true);
              },
              child: new Text(
                'Yes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            FlatButton(
              color: Colors.black12,
              shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                'No',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      )) ??
      false;
}
