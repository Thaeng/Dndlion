import 'package:dndlion/model/inventory/Inventory.dart';
import 'package:dndlion/view/tabs/inventory/InventoryState.dart';
import 'package:flutter/material.dart';

class InventoryWidget extends StatefulWidget {

  final Inventory inventory;

  const InventoryWidget({Key key, this.inventory}): super(key: key);

  @override
  InventoryState createState() {
    return InventoryState(inventory);
  }



}