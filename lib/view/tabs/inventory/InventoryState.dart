import 'package:dndlion/model/inventory/Inventory.dart';
import 'package:dndlion/model/inventory/Item.dart';
import 'package:dndlion/model/inventory/ItemTyp.dart';
import 'package:dndlion/view/tabs/inventory/AddItemDialog.dart';
import 'package:dndlion/view/tabs/inventory/InventoryWidget.dart';
import 'package:flutter/material.dart';

class InventoryState extends State<InventoryWidget> {

  Inventory inventory;
  final List<String> stats = ["Strength","Dexterity"];
  String dropdownValue;


  InventoryState(Inventory inventory) {
    this.inventory = inventory;
    dropdownValue = stats[0];
  }

  @override
  Widget build(BuildContext context) {
    return inventory.items != null && inventory.items.length > 0 ? _buildScaffold() : _buildEmptyInventory();
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: _buildAddItemFloatingActionButton(),
    );
  }

  Scaffold _buildEmptyInventory(){
    return Scaffold(
      body: buildStatSelection(),
      //body: Center(child : Text('No Items', style: TextStyle(fontSize: 40))),
      floatingActionButton: _buildAddItemFloatingActionButton(),
    );
  }

  Widget _buildBody(){
    return ListView.builder(
      itemCount: inventory.items.length * 2,
      itemBuilder: (context, i){
        if(i.isOdd) return Divider(thickness: 2.0, color: Theme.of(context).textTheme.body1.color,);
        return _buildItemListTile(inventory.items[i ~/ 2]);
      },
    );
  }

  ListTile _buildItemListTile(Item item){
    return ListTile(
      isThreeLine: true,
      leading: Icon(item.type.icon, color: Theme.of(context).primaryIconTheme.color),
      title: Text(item.name),
      subtitle: Text(item.line1 + "\n" + item.line2),
    );
  }

  FloatingActionButton _buildAddItemFloatingActionButton(){
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.green,
      onPressed: (){
        _asyncAddItemDialog(context);
      },
    );
  }

  void _asyncAddItemDialog(BuildContext context) async{
    Item item = Item();
    item.type = ItemType.weapon;
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AddItemDialog();
      }
    );
  }

  Widget buildStatSelection(){
    Widget widget = DropdownButton(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      items: stats.map((stat) => DropdownMenuItem(
        value: stat,
        child: Text(stat),
      )).toList(),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
    );

    return widget;
  }
}