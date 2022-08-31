# Music App

This is a simple app that plays previews of Musics from iTunes. It only play previews because in order to play the song in full, you'd have to play it in iTunes and buy the music.

## Features
There are various interactions that you can do with this apps, such as:

**Search Music by Artist**
Type the name of the artist on the Search Bar on the top of the page and the app will return 50 musics related to that artist.

**Play the Music**
Choose any music preview from the artist that you've searched. You can play it, pause it, or skip it. The music will stop after a few seconds (because they're just previews) and you have to manually play another music, or repeat the preview that was just finished playing.

## Supported Devices

**Android**
All Android devices with OS version over 4.1 Jellybean (SDK version 16)

**Tested in**
Samsung A52 Android OS version 12

## Installation

**Prerequisite**

- Make sure you have the latest Flutter SDK (at least version 2.17.6) to build the app
- Make sure you have added the Flutter SDK path in your environment variable
- [Resource](https://docs.flutter.dev/get-started/install/macos)

**Clone Project**
- Open Terminal 
- Go to folder where you want to clone
- Type in terminal `git clone https://github.com/agungnursatria/music_app.git`
- Open your `music_app` project

**How to Build**
- Open Terminal 
- Go to music_app folder
- To build the apk file:
    - Type `flutter build apk` the result apk will be found in `music_app/build/app/outputs/apk/`debug folder
- To install directly to Android phone/emulator
    - Make sure your phone/emulator connected to adb
        - For Android phone, you have to activate developer option and activate USB Debugging option
        - To check if the device already connected, go to terminal and type `adb devices`
    - Open Terminal
    - Go to music_app folder
    - Type in `flutter run`
    - Make sure your phone/emulator always connected to the computer while the installation process is taking place

**How to Test**
- Open Terminal 
- Go to music_app folder
- Type in `flutter test`

## Library References
- [Cupertino Icons](https://pub.dev/packages/cupertino_icons)
- [Dartz](https://pub.dev/packages/dartz)
- Room
- [Dio](https://pub.dev/packages/dio)
- [Flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [Get_it](https://pub.dev/packages/get_it)
- [Just Audio](https://pub.dev/packages/just_audio)
- [Equatable](https://pub.dev/packages/equatable)
- [Shimmer](https://pub.dev/packages/shimmer)
- [Bloc_test](https://pub.dev/packages/bloc_test)
- [Build_runner](https://pub.dev/packages/build_runner)
- [Mockito](https://pub.dev/packages/mockito)
