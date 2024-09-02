import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoCall extends StatefulWidget {
  final String channelName;
  final String appId;
  final String token;

  VideoCall({
    super.key,
    required this.channelName,
    required this.appId,
    required this.token,
  });

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  late final AgoraClient client;

  @override
  void initState() {
    super.initState();
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: widget.appId,
        channelName: widget.channelName,
        username: "user",
        tempToken: widget.token,
      ),
    );
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Meeting'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.oneToOne,
                enableHostControls: true,
              ),
              AgoraVideoButtons(
                client: client,
                addScreenSharing: false,
                  onDisconnect:(){
                  Navigator.of(context).pop();
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
