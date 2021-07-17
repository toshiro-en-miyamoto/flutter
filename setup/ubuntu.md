# Setting up Flutter on Ubuntu

- Ubuntu 21.04
- Flutter Linux 2.2.3

## Prerequisites
- `$ sudo apt install curl`
- `$ sudo apt install xz-utils`
- `$ sudo apt install libglu1-mesa`
- Chrome Browser

## Flutter SDK
- `$ sudo snap install flutter --classic`
- `$ flutter sdk-path`
  - downloads Dart SDK
  - builds flutter tools such as Framework and Engine
- `$ flutter doctor`
  - downloads Material fonts, Gradle Wrapper, `sky_engine`, `linux-arm64` tools, `linux-arm64/font-subset` tools
  - [✓] Flutter (Channel master, 2.4.0-5.0.pre.47, on Ubuntu 21.04...)
  - [✓] Chrome - develop for the web
  - [✗] Flutter IDE Support (No supported IDEs installed)
  - [!] Connected device -- No devices available

## Android Studio

- download [Android Studio](https://developer.android.com/studio)
- amd64 is available for Linux, arm64 is not
- going through `Android Studio Setup Wizard` insstalls the Android SDK
  - Android SDK Command-line Tools is missing during the installation, thus `flutter doctor --android-licenses` will fail;
  - you need to install it with Android Studio,
    - the Welcome to Android Studio pane > `Configure` > `Settings`
    - `Appearance & Behavior` > `System Settings` > `Android SDK`
    - on the `SDK Tools` pane, select `Android SDK Command-line Tools`, then `Apply`
  - now `flutter doctor --android-licenses` will work
- using AVD Manager, create at least one Android Virtual device
- `$ flutter doctor`
  - [✓] Flutter (Channel stable, 2.2.3, on Linux, locale en_US.UTF-8)
  - [✓] Android toolchain - develop for Android devices (Android SDK version 30.0.3)
  - [✓] Chrome - develop for the web
  - [✓] Android Studio (version 4.2)
  - [✓] Connected device (1 available)
- install the Flutter and Dart Plugins
  - the Welcome to Android Studio pane > `Configure` > `Settings`
  - on the `Plugins` pane, install the `Flutter` plugin; the Dart plugin will be installed as well
