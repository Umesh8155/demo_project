import 'package:flutter/material.dart';

class StateFullBuilderDialogScreen extends StatefulWidget {
  const StateFullBuilderDialogScreen({Key key}) : super(key: key);

  @override
  _StateFullBuilderDialogScreenState createState() => _StateFullBuilderDialogScreenState();
}

class _StateFullBuilderDialogScreenState extends State<StateFullBuilderDialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State full builder dialog"),
      ),
      body: bodyView(),
    );
  }

  Widget bodyView(){
    return Column(
      children: [
        Center(
          child: ElevatedButton(onPressed: (){
            showStateFullBuilderDialog();
          }, child: Text("Show Dialog")),
        ),
        Center(
          child: ElevatedButton(onPressed: (){
            showStateFullBuilderAlertDialog();
          }, child: Text("Show AlertDialog")),
        ),
      ],
    );
  }

  showStateFullBuilderDialog(){
    showDialog(
      context: context,
      builder: (context) {
        bool testBool = true; // This flag should be here.
        return StatefulBuilder(
          builder: (context, setState) {
           return Dialog(
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Text("StateFullBuilderDialog")
               ],
             ),
           );
          },
        );
      },
    );
  }

  showStateFullBuilderAlertDialog(){
    showDialog(
      context: context,
      builder: (context) {
        String contentText = "Content of Dialog";
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Title of Dialog"),
              content: Text(contentText),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      contentText = "Changed Content of Dialog";
                    });
                  },
                  child: Text("Change"),
                ),
              ],
            );
          },
        );
      },
    );
  }

}

