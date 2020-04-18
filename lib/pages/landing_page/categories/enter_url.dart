import 'package:flutter/material.dart';
import 'package:q_ours/widgets/material_parts.dart';
import 'package:q_ours/widgets/landing_page_divider.dart';
import 'package:q_ours/widgets/styled_form_field.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class EnterURL extends StatelessWidget {
  final textController = TextEditingController();
  
  Function() callback;

  EnterURL(this.callback);
  
  //Enter URL
  String url = 'https://randomuser.me/api/';

  Future<String> makeRequest() async {
    var response = await http.get(Uri.encodeFull(url),
    //Only accept JSON response
    headers: {"Accept": "application/json"});

    List data;
    var extractData = jsonDecode(response.body);
    //I am not sure how data is stored.
    data = extractData["GET-INFO"];

    //Printing data on the console for Testing
    print(data);
    
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FabDivider('Enter URL'),
        StyledFormField(650, 'Enter URL', textController),
        QOursSubmitLinkButton('Submit', this.callback)
      ],
      // Implement onPressed() to makeRequest()
        onPressed: makeRequest,
    );
  }
}
