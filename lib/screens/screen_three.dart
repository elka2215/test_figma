import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  File? imageOne;
  File? imageTwo;
  File? imageThree;

  Future pickImageOne(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => imageOne = imageTemporary);
    } on PlatformException catch (e) {
      print('Разрешение не получено : $e');
    }
  }
  Future pickImageTwo(ImageSource source) async {
    try {
      final imageTwo = await ImagePicker().pickImage(source: source);
      if (imageTwo == null) return;
      final imageTemporary = File(imageTwo.path);
      setState(() => this.imageTwo = imageTemporary);
    } on PlatformException catch (e) {
      print('Разрешение не получено : $e');
    }
  }
  Future pickImageThree(ImageSource source) async {
    try {
      final imageThree = await ImagePicker().pickImage(source: source);
      if (imageThree == null) return;
      final imageTemporary = File(imageThree.path);
      setState(() => this.imageThree = imageTemporary);
    } on PlatformException catch (e) {
      print('Разрешение не получено : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff01AAAD),
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xff34C759)),
                      onPressed: () {},
                      child: const Text(
                        'Выполненно',
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      )),
                ),
                const Text(
                  '№4589',
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Консультация юриста',
                  style: TextStyle(fontSize: 15, color: Color(0xff838385)),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Экономическая безопасность и противодействие коррупции',
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Дата обращения',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff838385),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  '15.01.2022 16:37',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Предоставленные данные',
                  style: TextStyle(fontSize: 15, color: Color(0xff838385)),
                ),
                const SizedBox(
                  height: 16,
                ),
                const TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) => bottomSheet());
                      },
                      child: Container(
                        color: const Color(0xff797979),
                        height: 100,
                        width: 80,
                        child: Center(
                          child: imageOne != null
                              ? Image.file(imageOne!, fit: BoxFit.cover)
                              : const Text('JPG'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 19.38,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) => bottomSheetTwo());
                      },
                      child: Container(
                        color: const Color(0xff797979),
                        height: 100,
                        width: 80,
                        child: Center(
                          child: imageTwo != null
                              ? Image.file(imageTwo!, fit: BoxFit.cover)
                              : const Text('JPG'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 19.38,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) => bottomSheetThree());
                      },
                      child: Container(
                        color: const Color(0xff797979),
                        height: 100,
                        width: 80,
                        child: Center(
                          child: imageThree != null
                              ? Image.file(imageThree!, fit: BoxFit.cover)
                              : const Text('JPG'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 19.38,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                          'Ваше обращение обработанно. Наш специалист направил письмо на почту: kakoytomail@bk.ru'),
                    ),
                    SizedBox(width: 20),
                    Image(image: AssetImage('assets/Group.png'),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text(
            'Выберите фото',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () {
                  pickImageOne(ImageSource.camera);
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('Camera'),
              ),
              TextButton.icon(
                onPressed: () {
                  pickImageOne(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
                label: const Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomSheetTwo() {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text(
            'Выберите фото',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () {
                  pickImageTwo(ImageSource.camera);
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('Camera'),
              ),
              TextButton.icon(
                onPressed: () {
                  pickImageTwo(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
                label: const Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget bottomSheetThree() {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text(
            'Выберите фото',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () {
                  pickImageThree(ImageSource.camera);
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('Camera'),
              ),
              TextButton.icon(
                onPressed: () {
                  pickImageThree(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
                label: const Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
