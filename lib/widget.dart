import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_members/member.dart';
import 'package:http/http.dart';
import 'dart:convert';

class MyWidget extends StatefulWidget {

  @override
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<MyWidget> {

  var _members = <Member>[];
  final _font = const TextStyle(fontSize: 20.0);

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  _loadData() async {
    String url = "https://api.github.com/orgs/ubuntu/members";
    Response response = await get(Uri.parse(url));

    //get data
    setState(() {
      final members = jsonDecode(response.body);

      for (var member in members) {
        _members.add(Member(member["login"], member["avatar_url"]));
      }

      print(_members);
    });
  }

  Widget _buildRow(int position) {
    return ListTile(
      //member login
      //title: Text("${_members[position]["login"]}", style: _font),
      title: Text(_members[position].login, style: _font),
      //member avatar
      leading: CircleAvatar(
        backgroundColor: Colors.black,
        backgroundImage: NetworkImage(_members[position].avatarUrl),
      ),
    );
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _members.length,
      itemBuilder: (BuildContext context, int position) {
        return _buildRow(position);
      },
    );
  }
}
