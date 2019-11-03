
import 'package:dndlion/model/Character.dart';
import 'package:dndlion/view/tabs/character/CharacterWidget.dart';
import 'package:dndlion/view/tabs/inventory/InventoryWidget.dart';
import 'package:flutter/material.dart';

class TabBarHome{

  DefaultTabController _tabController;
  Character _character;

  TabBarHome(Character character, BuildContext context){
    this._character = character;
    _initTabBarHome(context);
  }

  void _initTabBarHome(BuildContext context){
    _tabController = DefaultTabController(
      length: 2,
      child: _buildChild(context),
    );
  }

  DefaultTabController getHome(){
    return this._tabController;
  }

  Scaffold _buildChild(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: _buildTabBar(context),
        ),
      ),
      body: _buildBody(),
    );
  }

  TabBar _buildTabBar(BuildContext context){
    return TabBar(
      tabs: <Widget>[
        Tab(icon: Icon(Icons.person, color: Theme.of(context).primaryIconTheme.color)),
        Tab(icon: Icon(Icons.calendar_today, color: Theme.of(context).primaryIconTheme.color)),
      ],
    );
  }

  TabBarView _buildBody(){
    return TabBarView(
      children: <Widget>[
        CharacterWidget(character: _character),
        InventoryWidget(inventory: _character.inventory),
      ],
    );
  }
}