# Setting up Flutter on Mac

follow the instructions in [macOS install](https://flutter.dev/docs/get-started/install/macos)

## Flutter SDK

- download the Flutter SDK from [Get the Flutter SDK](https://flutter.dev/docs/get-started/install/macos)
- unzip the file (zip) in $HOME, you will have the `~/flutter` directory
- add the `flutter` tool to your path in `~/.zshenv`
  - `export PATH="$PATH:$HOME/flutter/bin`
- `$ which flutter dart`
  - /Users/(your home)/flutter/bin/flutter
  - /Users/(your home)/flutter/bin/dart
- `$ flutter doctor`
  - [✓] Flutter (Channel stable, 2.2.3, ...)
  - [✗] Android toolchain - develop for Android devices
  - [✗] Xcode - develop for iOS and macOS
    - ✗ Xcode installation is incomplete;
    - ✗ CocoaPods not installed.
  - [✓] Chrome - develop for the web
  - [!] Android Studio (not installed)
  - [✓] VS Code (version 1.58.1)

## Xcode

To develop Flutter apps for iOS, you need a Mac with Xcode installed.

- install the latest Xcode using the Mac App Store (12.5.1 as of July 15, 2021)
- Configure the Xcode command-line tools to use the newly-installed version of Xcode
  - `$ sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer`
  - `$ sudo xcodebuild -runFirstLaunch`
- the `xcodebuild` command will prompt for the licence agreement
- you might want to start Xcode
  - 14GB memory is used at this point
- make sure the iOS simulator runs
  - `$ open -a Simulator`
- `$ flutter doctor`
  - [✓] Flutter (Channel stable, 2.2.3, ...)
  - [✗] Android toolchain - develop for Android devices
  - [!] Xcode - develop for iOS and macOS
    - ✗ CocoaPods not installed.
  - [✓] Chrome - develop for the web
  - [!] Android Studio (not installed)
  - [✓] VS Code (version 1.58.1)
- the CocoaPods plugin is required if (1) your apps depend on *Flutter plugins* with iOS native code, or (2) you are developing macOS desktop apps. A plugin package is a special kind of package that makes platform functionality available to the app. For example, a plugin might provide Flutter apps with the ability to use a device’s camera.

## Android Studio

Flutter relies on a full installation of Android Studio to supply its Android platform dependencies.

- download [Android Studio](https://developer.android.com/studio)
- install Androud Studio from the dmg file
- start Android Studio, and go through the Android Studio Setup Wizard.
- The Android Studio Setup Wizard installation does not install the `Android SDK Command-line Tools`, that is why `flutter doctor --android-licenses' fails. Therefore, install the tool using the Android Studio:
  - the Welcome to Android Studio > Configure > Preferences
  - Appearance & Behavior > System Settings > Android SDK
  - on the SDK Tools pane, install the Android SDK Command-line Tools
  - now that the tool has been installed, you can sign the SDK license
- `$ flutter doctor --android-licenses`
- `$ flutter doctor`
  - [✓] Flutter (Channel stable, 2.2.3, ...)
  - [✓] Android toolchain - develop for Android devices (Android SDK version 31.0.0)
  - [!] Xcode - develop for iOS and macOS
    - ✗ CocoaPods not installed
  - [✓] Chrome - develop for the web
  - [✓] Android Studio (version 4.2)
  - [✓] VS Code (version 1.58.1)

## The Android Emulator

With the Android Virtual Device Manager (AVD Manager) of the Android Studio, you can create virtual devices that run in the Adndroid emulator.

## Flutter and Dart plugin

These plugins provide you with code completion, syntax highlighting, widget editing assist, run & debug support, and more.

- Install the Flutter plugin on the Android Studio
  - the Welcome to Android Studio > Configure > Preferences
  - on the Plugins pane,
    - install `Flutter` plugin
    - the Dart plugin will be installed along with the Flutter plugin
