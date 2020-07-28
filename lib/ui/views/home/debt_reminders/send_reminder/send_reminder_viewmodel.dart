import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:mycustomers/core/services/customer_contact_service.dart';

import 'package:mycustomers/core/models/hive/customer_contacts/customer_contact_h.dart';
import 'package:mycustomers/app/locator.dart';
import 'package:stacked/stacked.dart';

class SendMessageViewModel extends BaseViewModel {
  String _controllerValue;
  String _messageControllerValue;
  String get messageControllerValue => _messageControllerValue;
  get controllerValue => _controllerValue;

  final List<String> _messageEntries = <String>[
    "Don't leave me",
    "Happy New year",
    "Debt reminder"
  ];

  String number = "0786067005";

  List<String> get messageEntries => _messageEntries;
  final _customerContactService = locator<CustomerContactService>();
  CustomerContact get contact => _customerContactService.contact;

  void updateFieldValue(String buttonValue) {
    _controllerValue = buttonValue;
    print(_controllerValue);
    notifyListeners();
  }

  void clearMessageFields() {
    _controllerValue = "";
    _messageControllerValue = "";
    notifyListeners();
  }

  sendMessage() async {
    const uri = 'sms:+2348104034818?body=Hello%20there';
    if (Platform.isAndroid) {
      if (await canLaunch(uri)) {
        await launch(uri);
      }
    } else if (Platform.isIOS) {
      const uri = 'sms:0081-040-34818?body=Hello%20there';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }
}
