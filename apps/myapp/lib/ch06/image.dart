import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyImage1(),
    );
  }
}

class MyImage3 extends StatelessWidget {
  const MyImage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            MyStatefulImage(
                assetImage:
                    AssetImage('assets/logo_lockup_flutter_vertical.png')),
          ],
        ),
      ),
    );
  }
}

class MyImage2 extends StatelessWidget {
  const MyImage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Image(
              image: AssetImage('assets/logo_lockup_flutter_vertical.png'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyImage1 extends StatelessWidget {
  const MyImage1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/logo_lockup_flutter_vertical.png'),
    );
  }
}

class MyStatefulImage extends StatefulWidget {
  const MyStatefulImage({
    Key? key,
    required this.assetImage,
  }) : super(key: key);

  final AssetImage assetImage;

  @override
  State<MyStatefulImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyStatefulImage> {
  ImageStream? _imageStream;
  ImageInfo? _imageInfo;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // We call _getImage here because createLocalImageConfiguration() needs to
    // be called again if the dependencies changed, in case the changes relate
    // to the DefaultAssetBundle, MediaQuery, etc, which that method uses.
    _getImage();
  }

  @override
  void didUpdateWidget(MyStatefulImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.assetImage != oldWidget.assetImage) {
      _getImage();
    }
  }

  void _getImage() {
    final ImageStream? oldImageStream = _imageStream;
    _imageStream =
        widget.assetImage.resolve(createLocalImageConfiguration(context));
    if (_imageStream!.key != oldImageStream?.key) {
      // If the keys are the same, then we got the same image back, and so we don't
      // need to update the listeners. If the key changed, though, we must make sure
      // to switch our listeners to the new image stream.
      final ImageStreamListener listener = ImageStreamListener(_updateImage);
      oldImageStream?.removeListener(listener);
      _imageStream!.addListener(listener);
    }
  }

  void _updateImage(ImageInfo imageInfo, bool synchronousCall) {
    setState(() {
      // Trigger a build whenever the image changes.
      _imageInfo?.dispose();
      _imageInfo = imageInfo;
    });
  }

  @override
  void dispose() {
    _imageStream?.removeListener(ImageStreamListener(_updateImage));
    _imageInfo?.dispose();
    _imageInfo = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawImage(
      image: _imageInfo?.image, // this is a dart:ui Image object
      scale: _imageInfo?.scale ?? 1.0,
    );
  }
}
