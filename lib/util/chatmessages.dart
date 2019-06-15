import 'package:flutter/material.dart';
import 'package:googleapis/dialogflow/v2.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:flutter/services.dart';
import './chatMessageListItem.dart';
import './chatMessage.dart';

class ChatMessages extends StatefulWidget {
  @override
  _ChatMessagesState createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages>
    with TickerProviderStateMixin {
  List<ChatMessage> _messages = List<ChatMessage>();

  bool _isComposing = false;

  TextEditingController _controllerText = TextEditingController();
  DialogflowApi _dialog;

  @override
  void initState() {
    super.initState();

    _initChatbot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _buildList(),
          Divider(
            height: 8.0,
            color: Theme.of(context).accentColor,
          ),
          _buildComposer(),
        ],
      ),
    );
  }

  _buildList() {
    return Flexible(
      child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          reverse: true,
          itemCount: _messages.length,
          itemBuilder: (_, index) {
            return Container(

                child: ChatMessageListItem(_messages[index])
            );
          }),
    );
  }

  _buildComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
                controller: _controllerText,
                onChanged: (value) {
                  setState(() {
                    _isComposing = _controllerText.text.length > 0;
                  });
                },
                onSubmitted: _handleSubmit,
                decoration: InputDecoration.collapsed(hintText: "Type Here")),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed:
                _isComposing ? () => _handleSubmit(_controllerText.text) : null,
          )
        ],
      ),
    );
  }

  void _initChatbot() async {
    String configString =
        await rootBundle.loadString('config/credentials.json');
    String _dialogFlowConfig = configString;
    print("*********$_dialogFlowConfig**********");

    var credentials = ServiceAccountCredentials.fromJson(_dialogFlowConfig);
    const _SCOPES = const [DialogflowApi.CloudPlatformScope];
    var httpClient = await clientViaServiceAccount(credentials, _SCOPES);
    _dialog = DialogflowApi(httpClient);
    print("==================Here===========$_dialog");
  }

  _handleSubmit(String value) {
    _controllerText.clear();
    _addMessage(
      text: value,
      name: "Public User",
      initials: "PU",
    );

    _requestChatBot(value);
  }

  var projectid = "api-project-678867498702";

  _requestChatBot(String text) async {
    var dialogSessionId =
        "projects/$projectid/agent/sessions/api-project-678867498702";
    Map data = {
      "queryInput": {
        "text": {
          "text": text,
          "languageCode": "en",
        }
      }
    };
    print("0000000000");
    var request = GoogleCloudDialogflowV2DetectIntentRequest.fromJson(data);
    print("11111111111");
    var resp = await _dialog.projects.agent.sessions
        .detectIntent(request, dialogSessionId);
    var result = resp.queryResult;
    print("222222222222 $resp");
    _addMessage(
        name: "Police Bot",
        initials: "PB",
        bot: true,
        text: result.fulfillmentText);
  }

  void _addMessage(
      {String name, String initials, bool bot = false, String text}) {
    var animationController = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );

    var message = ChatMessage(
        name: name,
        text: text,
        initials: initials,
        bot: bot,
        animationController: animationController);
    setState(() {
      _messages.insert(0, message);
    });

    animationController.forward();
  }
}
