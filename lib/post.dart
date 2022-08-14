import 'package:flutter/material.dart';
import 'package:http/http.dart';

class metode_post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fungsi Post'),
      ),
      body: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final stateManager = HomePageManager();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Center(
          child: Wrap(
            spacing: 50,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: stateManager.makePostRequest,
                child: Text('POST'),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        ValueListenableBuilder<RequestState>(
          valueListenable: stateManager.resultNotifier,
          builder: (context, requestState, child) {
            if (requestState is RequestLoadInProgress) {
              return CircularProgressIndicator();
            } else if (requestState is RequestLoadSuccess) {
              return Expanded(
                  child: SingleChildScrollView(child: Text(requestState.body)));
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}

class HomePageManager {
  final resultNotifier = ValueNotifier<RequestState>(RequestInitial());
  static const urlPrefix = 'https://jsonplaceholder.typicode.com';

  Future<void> makePostRequest() async {
    resultNotifier.value = RequestLoadInProgress();
    final url = Uri.parse('$urlPrefix/users');
    final headers = {"Content-type": "application/json"};
    final json = '{"title": "Hello", "body": "body text", "userId": 1}';
    final response = await post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    _handleResponse(response);
  }

  void _handleResponse(Response response) {
    if (response.statusCode >= 400) {
      resultNotifier.value = RequestLoadFailure();
    } else {
      resultNotifier.value = RequestLoadSuccess(response.body);
    }
  }
}

class RequestState {
  const RequestState();
}

class RequestInitial extends RequestState {}

class RequestLoadInProgress extends RequestState {}

class RequestLoadSuccess extends RequestState {
  const RequestLoadSuccess(this.body);
  final String body;
}

class RequestLoadFailure extends RequestState {}
