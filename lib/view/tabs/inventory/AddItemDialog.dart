import 'package:flutter/material.dart';

class AddItemDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddItemDialogState();
  }
}

class _AddItemDialogState extends State<AddItemDialog> {
  List<String> stats = ["Strength", "Dexterity"];
  Container emptyContainer = Container();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: Text("Add Item"),
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                });
              },
              child: new Text('Cancel'),
            ),
            new FlatButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                });
              },
              child: new Text('Accept'),
            ),
          ],
          content: new SingleChildScrollView(
            child: Material(child: AddItemDialogContent(stats: stats)
            ),
          ),
        );
      },
      barrierDismissible: true,
    ));
  }



  @override
  Widget build(BuildContext context) {
    return emptyContainer;
  }
}

class AddItemDialogContent extends StatefulWidget {
  AddItemDialogContent({Key key, this.stats}) : super(key: key);

  final List<String> stats;

  @override
  State<StatefulWidget> createState() {
    return _AddDialogContentState();
  }
}

class _AddDialogContentState extends State<AddItemDialogContent> {
  String selectedStat = "Strength";

  Widget _getContent() {
    return Column(
      children: <Widget>[
        DropdownButton<String>(
          value: selectedStat,
          icon: Icon(Icons.arrow_downward),
          items: widget.stats
              .map((stat) => DropdownMenuItem(
                    value: stat,
                    child: Text(stat),
                  ))
              .toList(),
          onChanged: (String newValue) {
            setState(() {
              selectedStat = newValue;
            });
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContent();
  }
}
