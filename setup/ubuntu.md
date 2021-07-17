# Setting up Flutter on Ubuntu

- Ubuntu 21.04
- Flutter Linux 2.2.3

## Prerequisites
- `$ sudo apt install curl`
- `$ sudo apt install xz-utils`
- `$ sudo apt install libglu1-mesa`

## Flutter SDK
- `$ sudo snap install flutter --classic`
- `$ flutter sdk-path`
  - downloads Dart SDK
  - builds flutter tools such as Framework and Engine
- `$ flutter doctor`
  - downloads Material fonts, Gradle Wrapper, `sky_engine`, `linux-arm64` tools, `linux-arm64/font-subset` tools
  - [✔️] Flutter (Channel master, 2.4.0-5.0.pre.47, on Ubuntu 21.04...)
  - [✖️] Chrome - develop for the web (cannot find Chrome executable...)
  - [✖️] Flutter IDE Support (No supported IDEs installed)
  - [!] Connected device -- No devices available

## Android Studio

- download [Android Studio](https://developer.android.com/studio)
- amd64 is available for Linux, arm64 is not
- going through `Android Studio Setup Wizard` insstalls the Android SDK
- Android SDK Command-line Tools is missing during the installation, thus `flutter doctor --android-licenses` will fail; you need to install it with Android Studio, `Preferences` > `Setup & Appearance` > 

