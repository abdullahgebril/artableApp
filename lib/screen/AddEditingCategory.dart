import 'package:artableapp/model/Category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/DummyData.dart';

class AddEditindCategory extends StatefulWidget {
  final String id;
  AddEditindCategory(this.id);
  @override
  _AddEditindCategoryState createState() => _AddEditindCategoryState();
}

class _AddEditindCategoryState extends State<AddEditindCategory> {
  final imageurlFocusNode = FocusNode();
  final imageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var editCaetgory = Category(title: '', imageUrl: '', id: null);
  var initValues = {'title': '', 'imageURL': ''};
  bool isinit = true;
  @override
  void didChangeDependencies() {
    if (isinit) {
      if (!widget.id.isEmpty) {
        editCaetgory =
            Provider.of<Dummydata>(context, listen: false).findById(widget.id);
        initValues = {
          'title': editCaetgory.title,
        };
        imageController.text = editCaetgory.imageUrl;
      }
    }
    isinit = false;

    super.didChangeDependencies();
  }

  @override
  void initState() {
    imageController.addListener(updateUIImage);
    super.initState();
  }

  void updateUIImage() {
    if (!imageurlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  Future<void> saveForm() async{
    final isvalid = formKey.currentState.validate();
    if (!isvalid) {
      return;
    }
    formKey.currentState.save();
    if (editCaetgory.id != null) {
    await Provider.of<Dummydata>(context, listen: false)
          .updateCategory(editCaetgory.id, editCaetgory);
    } else {
      try {
      await   Provider.of<Dummydata>(context, listen: false).addCategory(
            editCaetgory);
      }
      catch (e) {
         await showDialog(context: context, builder: (cxt) =>
            AlertDialog(
              title: Text('An error occured'),
              content: Text('Something went wrong'),
              actions: <Widget>[
                FlatButton(child: Text('ok'), onPressed: () {
                  Navigator.of(context).pop();
                },)
              ],
            ));
      }
    }
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    imageurlFocusNode.dispose();
    imageurlFocusNode.removeListener(updateUIImage);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' your Category'),
        actions: <Widget>[
          IconButton(
            onPressed: saveForm,
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: initValues['title'],
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(imageurlFocusNode);
                },

                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please you Must Enter Title';
                  }
                  return null;
                },
                onSaved: (value) {
                  editCaetgory = Category(
                      title: value,
                      imageUrl: editCaetgory.imageUrl,
                      id: editCaetgory.id);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    child: imageController.text.isEmpty
                        ? Center(
                            child: Text('Enter Image URL'),
                          )
                        : FittedBox(child: Image.network(imageController.text)),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Enter Image URL'),
                      textInputAction: TextInputAction.done,
                      controller: imageController,
                      focusNode: imageurlFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter  URl';
                        }
                        if (!value.startsWith('http') &&
                            !value.startsWith('https')) {
                          return ' Please Enter valid URL';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        editCaetgory = Category(
                            title: editCaetgory.title,
                            imageUrl: value,
                            id: editCaetgory.id);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
