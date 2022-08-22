import 'dart:convert';

import 'package:secondnumber/core/utils/utils.dart';
import 'package:secondnumber/models/credit.dart';
import 'package:secondnumber/models/error.dart';
import 'package:secondnumber/models/sms.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:http/http.dart' as http;

class Twilio_Config {
  TwilioFlutter twilioFlutter = TwilioFlutter(
      accountSid: 'ACba023afae81e94aeedf40a817503fa49',
      authToken: 'f71f1b0b60b630dd06a3b883ab23ea9a',
      twilioNumber: '+16197775576');
// Send msg to direct number.
  void sendSms(num, msg) async {
    twilioFlutter.sendSMS(toNumber: num, messageBody: msg);
  }

  final http.Client client = http.Client();
  @override
  Future<SentSmsData> getSmsList(
      {required String pageSize, required TwilioCreds? twilioCreds}) async {
    String url = twilioCreds!.url + '?PageSize=$pageSize';
    String cred = twilioCreds.cred;
    var bytes = utf8.encode(cred);
    var base64Str = base64.encode(bytes);
    var headers = {
      'Authorization': 'Basic $base64Str',
      'Accept': 'application/json'
    };
    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final sentSmsData = sentSmsDataFromJson(response.body);
      return sentSmsData;
    } else {
      print('Request Failed');
      throw Exception();
    }
  }

  @override
  Future<int> sendSMS(
      {required String toNumber,
      required String messageBody,
      required TwilioCreds? twilioCreds}) async {
    String cred = twilioCreds!.cred;
    var bytes = utf8.encode(cred);
    var base64Str = base64.encode(bytes);

    var headers = {
      'Authorization': 'Basic $base64Str',
      'Accept': 'application/json'
    };
    var body = {
      'From': twilioCreds.twilioNumber,
      'To': toNumber,
      'Body': messageBody
    };
    http.Response response = await http.post(Uri.parse(twilioCreds.url),
        headers: headers, body: body);
    if (response.statusCode == 201) {
      print('Sms sent Success');
      return response.statusCode;
    } else {
      print('Sending Failed');
      ErrorData errorData = ErrorData.fromJson(jsonDecode(response.body));
      print('Error Code : ' + errorData.code.toString());
      print('Error Message : ' + errorData.message!);
      print("More info : " + errorData.moreInfo!);
      throw Exception();
    }
  }

  @override
  Future<Message> getSmsData(
      {required String messageSID, required TwilioCreds? twilioCreds}) async {
    String uri =
        '${Utils.baseUri}/${Utils.version}/Accounts/${twilioCreds!.accountSid}/Messages/$messageSID';
    uri = uri + '.json';
    String cred = twilioCreds.cred;
    var bytes = utf8.encode(cred);
    var base64Str = base64.encode(bytes);
    var headers = {
      'Authorization': 'Basic $base64Str',
      'Accept': 'application/json'
    };
    http.Response response = await http.get(
      Uri.parse(uri),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final messageData = Message.fromJson(jsonDecode(response.body));
      return messageData;
    } else {
      print('Request Failed');
      throw Exception();
    }
  }

// make call
// list of numbers
// buy numbers
// current user numbers
// login
// sign up
// forget pass
// rest pass
// verify num
// interest list
// delete number
//

}
