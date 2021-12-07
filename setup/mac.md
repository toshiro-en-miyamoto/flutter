# Setting up Flutter on Mac

follow the instructions in [macOS install](https://flutter.dev/docs/get-started/install/macos)

## Flutter SDK

- if you already have installed SDK,
  - `$ flutter doctor` to check a newer version
  - `$ flutter upgrade` will update to the latest if any
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
- `$ sudo gem install cocoapods`
- `$ flutter doctor`
  - [✓] Flutter (Channel stable, 2.5.3, on macOS 12.0.1 21A559 darwin-x64, locale ja-PH)
  - [✓] Android toolchain - develop for Android devices (Android SDK version 31.0.0)
  - [✓] Xcode - develop for iOS and macOS
  - [✓] Chrome - develop for the web
  - [✓] Android Studio (version 4.2)
  - [✓] VS Code (version 1.58.2)
  - [✓] Connected device (1 available)
  - • No issues found!


## Android Studio

Flutter relies on a full installation of Android Studio to supply its Android platform dependencies.

- if you already have installed Android Studio,
  - start Android Studio, which install the latest components if any
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
  - [✓] Flutter (Channel stable, 2.5.3, on macOS 12.0.1 21A559 darwin-x64, locale ja-PH)
  - [✓] Android toolchain - develop for Android devices (Android SDK version 31.0.0)
  - [✓] Xcode - develop for iOS and macOS
  - [✓] Chrome - develop for the web
  - [✓] Android Studio (version 2020.3)
  - [✓] VS Code (version 1.58.2)
  - [✓] Connected device (1 available)
  - • No issues found!

## The Android Emulator

With the Android Virtual Device Manager (AVD Manager) of the Android Studio, you can create virtual devices that run in the Adndroid emulator.

- `$ ./Library/Android/sdk/emulator/emulator -accel-check`
  - accel:
  - 0
  - Hypervisor.Framework OS X Version 12.0
  - accel


## Flutter and Dart plugin

These plugins provide you with code completion, syntax highlighting, widget editing assist, run & debug support, and more.

- Install the Flutter plugin on the Android Studio
  - the Welcome to Android Studio > Configure > Preferences
  - on the Plugins pane,
    - install `Flutter` plugin
    - the Dart plugin will be installed along with the Flutter plugin

## Web setup

Flutter has support for building web applications in the stable channel. Any app created in Flutter 2 automatically builds for the web.

Hot reload is not supported in a web browser Currently, Flutter supports hot restart, but not hot reload in a web browser.

- make sure if the channel is Stable
  - `$ flutter channel`
- the Chrome browser is required to debugging web apps
  - `$ flutter devices`
    - 1 connected device:
    - Chrome (web) • chrome • web-javascript • Google Chrome 96.0.4664.55
- run a web app in the Chrome browser
  - `$ flutter create myapp`
  - `$ cd myapp`
  - `$ flutter run -d chome`
