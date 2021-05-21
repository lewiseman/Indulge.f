import 'package:flutter/material.dart';
//import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:indulge_me/logic/add/text/services.dart';
import 'package:get/get.dart';
import 'package:indulge_me/root.dart';
import 'package:indulge_me/screens/items/text/fab.dart';
import 'package:form_field_validator/form_field_validator.dart';

class TextContent extends StatefulWidget {
  @override
  _TextContentState createState() => _TextContentState();
}

class _TextContentState extends State<TextContent> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController cTitle = TextEditingController();

  TextEditingController cStory = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post ...'),
        centerTitle: true,
        actions: [
          TextButton.icon(
            icon: Icon(Icons.post_add_outlined),
            label: Text('Post'),
            onPressed: () async {
              String title = cTitle.text;
              String story = cStory.text;
              if (formKey.currentState.validate()) {
                await addText(title, story);
                Get.off(IndulgeMe());
              }
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: cTitle,
                scrollPhysics: BouncingScrollPhysics(),
                scrollPadding: EdgeInsets.all(20.0),
                autofocus: true,
                minLines: 1,
                maxLines: 4,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                decoration: InputDecoration.collapsed(
                  hintText: 'Title',
                  hintStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                validator: MaxLengthValidator(100,
                    errorText: 'Title can\'t be more than 100 characters'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextFormField(
                  controller: cStory,
                  scrollPadding: EdgeInsets.all(20.0),
                  autofocus: true,
                  minLines: 1,
                  maxLines: 99999,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Inspire the World ...',
                  ),
                  validator:
                      RequiredValidator(errorText: 'Content can\'t be empty'),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FAB(),
    );
  }
}
