# 📹 Agora Video Calling - Flutter

![Flutter](https://img.shields.io/badge/Flutter-3.13.9-blue)
![Agora](https://img.shields.io/badge/Agora-4.2.1-red)
![Platforms](https://img.shields.io/badge/Platforms-iOS%20|%20Android%20|%20Web-green)
![License](https://img.shields.io/badge/license-MIT-brightgreen)

A complete, production-ready video calling solution for Flutter using Agora SDK. Supports **1:1 calls, group meetings, screen sharing, and real-time messaging**.

## ✨ Key Features

- 🎥 **High-quality video calls** (720p/1080p)
- 🎙️ **Crystal clear audio** with noise suppression
- 👥 **Multi-user conferences** (up to 17 participants)
- 🖥️ **Screen sharing** (Android/iOS/Web)
- 🔒 **End-to-end encryption** for secure calls
- 🌐 **Cross-platform** (iOS, Android, Web)
- 💬 **In-call chat messaging**
- 🎚️ **Device management** (camera/mic/speaker control)

## 🎥 Demo




## 🚀 Quick Setup

### 1. Add Dependencies
```yaml
dependencies:
  agora_rtc_engine: ^6.2.1
  permission_handler: ^10.2.0
  flutter_local_notifications: ^13.0.0
```

### 2. Platform Configuration

**Android**:
1. Add camera/microphone permissions to `AndroidManifest.xml`
2. Enable Java 8 support in `build.gradle`

**iOS**:
1. Add `NSCameraUsageDescription` and `NSMicrophoneUsageDescription` to `Info.plist`
2. Enable background modes for VoIP

**Web**:
1. Add CSP rules to `index.html`
2. Configure CORS for your domain

### 3. Initialize Agora Engine
```dart
final RtcEngine _engine = await RtcEngine.createWithContext(
  RtcEngineContext(
    APP_ID, // Your Agora App ID
    channelProfile: ChannelProfile.LiveBroadcasting,
  )
);

await _engine.enableVideo();
await _engine.setClientRole(ClientRole.Broadcaster);
```

## 💻 Basic Implementation

### Join Channel
```dart
await _engine.joinChannel(
  token: TEMP_TOKEN, // Use null for testing
  channelId: 'test_channel',
  uid: 0, // 0 = auto-assign UID
  options: ChannelMediaOptions(),
);
```

### Setup Video View
```dart
// Local view
AgoraVideoView(
  controller: VideoViewController(
    rtcEngine: _engine,
    canvas: VideoCanvas(uid: 0),
  ),
)

// Remote view
AgoraVideoView(
  controller: VideoViewController.remote(
    rtcEngine: _engine,
    canvas: VideoCanvas(uid: remoteUid),
    connection: RtcConnection(channelId: 'test_channel'),
  ),
)
```

## 🛠️ Advanced Features

### Screen Sharing (Android/iOS)
```dart
await _engine.startScreenCapture(
  ScreenCaptureParameters(
    captureAudio: true,
    videoParams: ScreenVideoParameters(
      dimensions: VideoDimensions(width: 1280, height: 720),
      frameRate: 15,
    ),
  ),
);
```

### In-Call Controls
```dart
// Toggle camera
await _engine.switchCamera();

// Mute/unmute
await _engine.muteLocalAudioStream(true);

// Speaker control
await _engine.setEnableSpeakerphone(true);
```

### Event Handling
```dart
_engine.setEventHandler(RtcEngineEventHandler(
  joinChannelSuccess: (channel, uid, elapsed) {
    // Handle join success
  },
  userJoined: (uid, elapsed) {
    // Add remote video view
  },
  userOffline: (uid, reason) {
    // Remove remote view
  },
));
```

## 🔐 Security Best Practices

1. **Use Tokens** (not App ID alone) in production
2. Implement token generation on your backend
3. Enable encryption with `_engine.setEncryptionSecret()`
4. Use role-based permissions



## 📜 License

MIT License - See [LICENSE](LICENSE) for details.

---

## 💼 Hire Me & Support My Work

### 🤝 Available for Projects
I'm open to **Flutter development**, **API integrations**, and **consulting work**.

📱 **Phone/WhatsApp**: [+91 7991327022](https://wa.me/917991327022)  
📧 **Email**: [harendraprajapati72@gmail.com](mailto:harendraprajapati72@gmail.com)  
🌐 **Website**: [nayaproyog.com](https://nayaproyog.com)  
💻 **Portfolio**: [github.helloharendra.io](https://github.helloharendra.io)  

### ☕ Buy Me a Coffee
If you appreciate my work, consider supporting me:

[![Buy Me A Coffee](https://img.shields.io/badge/Buy_Me_A_Coffee-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://www.buymeacoffee.com/helloharendra)





