import 'package:flutter/material.dart';
import 'package:zoom_clone1/resources/auth_methods.dart';
import 'package:zoom_clone1/utiles/colors.dart';
import 'package:zoom_clone1/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethod _authMethod = AuthMethod();
  late TextEditingController meetingIdController;
  /* late TextEditingController nameController;*/

  bool isAudioMuted = true;
  bool isVidoeMuted = true;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    /*  nameController = TextEditingController(
      text: _authMethod.user.displayName,
    );*/
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
  }
 _joinMetting() {


 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          'Join a Meetng',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetingIdController,
              maxLines: 1,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Room ID',
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              /*controller: nameController,*/
              maxLines: 1,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Name',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinMetting,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Join',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 20,),
          MeetingOption(text: 'Mute Audio', onChange: onAudioMuted, isMute: isAudioMuted,),
          MeetingOption(text: 'Turn off my video', onChange: onVideoMuted, isMute: isAudioMuted,),
        ],
      ),
    );
  }

  onAudioMuted(bool? val) {
    setState(() {
      isAudioMuted = val!;
    });
  }
  onVideoMuted(bool? val) {
    setState(() {
      isVidoeMuted = val!;
    });
  }


}
