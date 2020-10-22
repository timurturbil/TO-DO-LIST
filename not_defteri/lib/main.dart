



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:not_defteri/veritaban%C4%B1/anaveritaban%C4%B1.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => AnaVeritabani(),
    },
  ));
}

















/* import 'package:flutter/material.dart';
import 'package:not_defteri/secondroute.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(new TodoApp());

// Every component in Flutter is a widget, even the whole app itself
class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'Todo List', home: new TodoList());
  }
}

List<String> todoItems = [];

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocalData();
  }

  Future getLocalData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> todoItems = [];

    setState(() => todoItems.add(preferences.getString("key")));
  }

  void _removeTodoItem(int index) {
    setState(() => todoItems.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text('Mark "${todoItems[index]}" as done?'),
              actions: <Widget>[
                new FlatButton(
                    child: new Text('CANCEL'),
                    // The alert is actually part of the navigation stack, so to close it, we
                    // need to pop it.
                    onPressed: () => Navigator.of(context).pop()),
                new FlatButton(
                    child: new Text('MARK AS DONE'),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  // Build the whole list of todo items
  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        // itemBuilder will be automatically be called as many times as it takes for the
        // list to fill up its available space, which is most likely more than the
        // number of todo items we have. So, we need to check the index is OK.

        if (index < todoItems.length) {
          return _buildTodoItem(todoItems[index], index);
        }
      },
    );
  }

  // Build a single todo item
  Widget _buildTodoItem(String todoText, int index) {
    return new ListTile(
        title: new Text(todoText), onTap: () => _promptRemoveTodoItem(index));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Todo List')),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Ek(),
                ));
          },
          tooltip: 'Add task',
          child: new Icon(Icons.add)),
    );
  }
}

class Ek extends StatefulWidget {
  @override
  _EkState createState() => _EkState();
}

class _EkState extends State<Ek> {
  final TextEditingController itemcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Add a new task')),
        body: Column(children: [
          TextField(
            controller: itemcontroller,
            decoration: InputDecoration(
              labelText: " your task ",
            ),
          ),
          RaisedButton(
            child: Text("get back"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]));
  }

  Future savetask() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var list = preferences.getStringList("key");
    list.add(itemcontroller.text);
    await preferences.setStringList("key", list);
  }
}
 */