import 'package:flutter/material.dart';
import 'package:reorderablelistview_and_slidable/people.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:toast/toast.dart';

class AppDetail extends StatefulWidget {
  const AppDetail({super.key});

  @override
  State<AppDetail> createState() => _AppDetailState();
}

class _AppDetailState extends State<AppDetail> {
  var ls = People.generate();
  //
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return ReorderableListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: ls.length,
      onReorder: _onReorder,
    );
  }

////////
  Widget _itemBuilder(BuildContext context, int index) {
    return Slidable(
      key: ValueKey(ls[index].id),
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        IconSlideAction(
          onTap: () => _onTapEdit(index),
          closeOnTap: false,
          foregroundColor: Colors.white,
          color: Colors.amber.withOpacity(0.8),
          caption: 'Edit',
          iconWidget: Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
        //
        IconSlideAction(
          onTap: () => _onTapDelete(index),
          closeOnTap: false,
          color: Colors.red,
          foregroundColor: Colors.white,
          caption: 'Delete',
          iconWidget: Icon(
            Icons.delete,
            color: Colors.amber,
          ),
        ),
      ],
      //To slide to delete
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
        onDismissed: ((actionType) {
          setState(() {
            ls.removeAt(index);
          });
        }),
      ),
      //
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(ls[index].photo),
          radius: 30,
        ),
        //
        title: Text(ls[index].name),
        //
        subtitle: Text(ls[index].email),
      ),
    );
  }

  //
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      var item = ls.removeAt(oldIndex);
      if (newIndex > oldIndex) newIndex--;
      ls.insert(newIndex, item);
    });
  }

  void _onTapEdit(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: TextFormField(
              initialValue: ls[index].name,
              onFieldSubmitted: (value) {
                setState(() {
                  ls[index].name = value;

                  Navigator.of(context).pop();
                  Toast.show('Click Edit');
                });
              },
            ),
          );
        });
  }

  void _onTapDelete(int index) {
    setState(() {
      ls.removeAt(index);
      Toast.show('Edit succesful');
    });
  }
}
