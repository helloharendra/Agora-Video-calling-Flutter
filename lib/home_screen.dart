import 'package:agora_demo/video_call.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController channelName = TextEditingController();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: channelName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Channel name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VideoCall(
                              channelName: channelName.text,
                              appId: '0df78fe5f92a44c79ffbdd0495c789a2',
                              token:
                                  '007eJxTYJh64TjnBgmfeSrdjfvmTGpvy9zsr/b2Z+Yr9lvtCw+Xf5uowGCQkmZukZZqmmZplGhikmxumZaWlJJiYGJpmmxuYZloVOC0Pa0hkJEhW+Q+MyMDBIL4nAyJ6flFiS6pufkMDACnHyOR',
                            )),
                  );
                },
                child: const Text('Next'))
          ],
        ),
      ),
    );
  }
}
