import 'package:flutter/material.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart'; 
import 'package:sjcl/screens/open_url.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class AddressAlertDialog extends StatelessWidget {
  const AddressAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      //this right here
      child: SizedBox(
        height: 300,
        child: Card(
          color: Constants.primaryColor,
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: Center(
                  child: CustomText(
                    title: Constants.address,
                    color: Constants.primaryColorWhite,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Card(
                        child: TextButton(
                          onPressed: () => makeCall(),
                          child: const CustomText(
                            title: "Call",
                            color: Constants.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: TextButton(
                          onPressed: () => sendEmail(),
                          child: const CustomText(
                            title: "Email",
                            color: Constants.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Card(
                        child: TextButton(
                          onPressed: () => openUrl(context,
                              url:
                                  "https://www.google.com/maps/dir//sjcl/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3bae15d7793d0805:0x5c149dad433ba9a1?sa=X&ved=2ahUKEwjqmbnW_cL4AhWdSGwGHQL-CtkQ9Rd6BAhNEAU",
                              color: Constants.primaryColor),
                          child: const CustomText(
                            title: "Go To Map",
                            color: Constants.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: TextButton(
                          onPressed: () => openUrl(context,
                              url: "https://www.sjcl.edu.in/index.php",
                              color: Constants.primaryColor),
                          child: const CustomText(
                            title: "Website",
                            color: Constants.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  makeCall() {
    UrlLauncher.launch("tel:+919481545478");
  }

  sendEmail() {
    UrlLauncher.launch("mailto:sjlawcollege@gmail.com");
  }

  multiNumbers(){
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      //this right here
      child: Column(
        children: [
          TextButton(
            onPressed: () => UrlLauncher.launch("tel:+91 9481545478"),
            child: const CustomText(
              title: "+91 9481545478",
              color: Constants.primaryColor,
            ),
          ),
          TextButton(
            onPressed: () => UrlLauncher.launch("tel:+91 080 22223352"),
            child: const CustomText(
              title: "080 22223352",
              color: Constants.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
