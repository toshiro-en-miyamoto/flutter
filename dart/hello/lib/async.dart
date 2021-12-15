import 'dart:io';

import 'dart:isolate';

void longRunningOperation1() {
  for (var i = 0; i < 5; i++) {
    sleep(Duration(seconds: 1));
    print('index: $i');
  }
}

void tryAsync1() {
  print('start of long running operation');
  longRunningOperation1();
  print('continueing main body');
  for (var i = 10; i < 15; i++) {
    sleep(Duration(seconds: 1));
    print('index from main: $i');
  }
  print('end of main');
}

Future<void> longRunningOperation2() async {
  for (var i = 0; i < 5; i++) {
    sleep(Duration(seconds: 1));
    print('index: $i');
  }
}

void tryAsync2() {
  print('start of long running operation');
  longRunningOperation2();
  print('continueing main body');
  for (var i = 10; i < 15; i++) {
    sleep(Duration(seconds: 1));
    print('index from main: $i');
  }
  print('end of main');
}

Future<void> longRunningOperation3() async {
  for (var i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('index: $i');
  }
}

void tryAsync3() {
  print('start of long running operation');
  longRunningOperation3();
  print('continueing main body');
  for (var i = 10; i < 15; i++) {
    sleep(Duration(seconds: 1));
    print('index from main: $i');
  }
  print('end of main');
}

void tryAsync4() async {
  print('start of long running operation');
  // ignore: unawaited_futures
  longRunningOperation3();
  print('continueing main body');
  for (var i = 10; i < 15; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('index from main: $i');
  }
  print('end of main');
}

Future<void> longRunningOperation5(String message) async {
  for (var i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('$message: $i');
  }
}

void tryIsolate1() async {
  print('start of long running operation');
  // ignore: unawaited_futures
  Isolate.spawn(longRunningOperation5, 'Hello');
  print('continueing main body');
  for (var i = 10; i < 15; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('index from main: $i');
  }
  print('end of main');
}
