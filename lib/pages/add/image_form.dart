import 'dart:io';

import 'package:HIVApp/components/custom_button.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:HIVApp/db/db_provider.dart';
import 'package:HIVApp/db/image_files.dart';
import 'package:HIVApp/pages/my_state/result/results_tests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:easy_localization/easy_localization.dart';

class ImageForm extends StatefulWidget {

  String title;
  int type;

  ImageForm({this.title, this.type});

  @override
  _ImageFormState createState() => _ImageFormState();
}

class _ImageFormState extends State<ImageForm> {
  PickedFile _imageFile;
  dynamic _pickImageError;
  bool isVideo = false;
  String _retrieveDataError;
  File _tmpFile;
  int type;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();


  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
    {
      try {
        final pickedFile = await _picker.getImage(
          source: source,
        );

        setState(() {
          _imageFile = pickedFile;
          _tmpFile = File(pickedFile.path);
        });
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    }
  }

  getImageList() async {
    await DBProvider.db.getAllUserImages(type);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Widget _previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      if (kIsWeb) {
        // Why network?
        // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
        return Image.network(_imageFile.path);
      } else {
        return Semantics(
            child: Image.file(File(_imageFile.path)),
            label: 'image_picker_example_picked_image');
      }
    } else if (_pickImageError != null) {
      return Text(
        'not_yet_image_picked'.tr(),
        textAlign: TextAlign.center,
      );
    } else {
      return Text(
        'not_yet_image_picked'.tr(),
        textAlign: TextAlign.center,
      );
    }
  }

  Future<void> retrieveLostData() async {
    final LostData response = await _picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _imageFile = response.file;
      });
    } else {
      _retrieveDataError = response.exception.code;
    }
  }

  @override
  void initState() {
    type = widget.type;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getImageList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.tr()),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Center(
            child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
                ? FutureBuilder<void>(
              future: retrieveLostData(),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Text(
                      'not_yet_image_picked'.tr(),
                      textAlign: TextAlign.center,
                    );
                  case ConnectionState.done:
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                        child: _previewImage()
                    );
                  default:
                    if (snapshot.hasError) {
                      return Text(
                        'error'.tr(),
                        textAlign: TextAlign.center,
                      );
                    } else {
                      return Text(
                        'not_yet_image_picked'.tr(),
                        textAlign: TextAlign.center,
                      );
                    }
                }
              },
            )
                : (_previewImage()),
          ),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            width: MediaQuery.of(context).size.width * 0.5,
            child: CustomButton(
              text: 'add'.tr(),
              onPressed: () async{
                final appDir = await getApplicationDocumentsDirectory();
                final fileName = path.basename(_tmpFile.path);
                final savedImage = await _tmpFile.copy('${appDir.path}/$fileName');
                UserImageFile model = new UserImageFile();
                model.path = savedImage.path;
                model.file_name = fileName;
                model.date_time = DateTime.now();
                model.user_id = 1;
                model.type = type;
                await DBProvider.db.newUserImage(model);
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        ResultsOfTests(),
                ));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Semantics(
            label: 'image_picker_example_from_gallery',
            child: FloatingActionButton(
              onPressed: () {
                isVideo = false;
                _onImageButtonPressed(ImageSource.gallery, context: context);
              },
              heroTag: 'image0',
              tooltip: 'Pick Image from gallery',
              child: const Icon(Icons.photo_library),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                isVideo = false;
                _onImageButtonPressed(ImageSource.camera, context: context);
              },
              heroTag: 'image1',
              tooltip: 'Take a Photo',
              child: const Icon(Icons.camera_alt),
            ),
          ),
        ],
      ),
    );
  }

  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

}

typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);

