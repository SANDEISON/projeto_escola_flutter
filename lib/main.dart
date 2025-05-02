import 'package:flutter/material.dart';

/// Flutter code sample for [ListTile].

void main() => runApp(const ListTileApp());

class ListTileApp extends StatelessWidget {
  const ListTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(useMaterial3: true), home: const ListTileExample());
  }
}

class ListTileExample extends StatelessWidget {
  const ListTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('lista dos alunos cadastrados')),
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: CircleAvatar(child: Text('A')),
            title: Text('Sandeison Silva Fernandes'),
            subtitle: Text('Matricula: 01010101'),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
          ListTile(
            leading: CircleAvatar(child: Text('B')),
            title: Text('Joaquim jose'),
            subtitle: Text(
              'Matricula : 02020202',
            ),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
          ListTile(
            leading: CircleAvatar(child: Text('C')),
            title: Text('Karla da silva lopes'),
            subtitle: Text(
              "Matricula : 03030303030",
            ),
            trailing: Icon(Icons.favorite_rounded),
            isThreeLine: true,
          ),
          Divider(height: 0),
           ListTile(
            leading: CircleAvatar(child: Text('A')),
            title: Text('Sandeison Silva Fernandes'),
            subtitle: Text('Matricula: 01010101'),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
           ListTile(
            leading: CircleAvatar(child: Text('A')),
            title: Text('Sandeison Silva Fernandes'),
            subtitle: Text('Matricula: 01010101'),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
           ListTile(
            leading: CircleAvatar(child: Text('A')),
            title: Text('Sandeison Silva Fernandes'),
            subtitle: Text('Matricula: 01010101'),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
           ListTile(
            leading: CircleAvatar(child: Text('A')),
            title: Text('Sandeison Silva Fernandes'),
            subtitle: Text('Matricula: 01010101'),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
           ListTile(
            leading: CircleAvatar(child: Text('A')),
            title: Text('Sandeison Silva Fernandes'),
            subtitle: Text('Matricula: 01010101'),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
           ListTile(
            leading: CircleAvatar(child: Text('A')),
            title: Text('Sandeison Silva Fernandes'),
            subtitle: Text('Matricula: 01010101'),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
           ListTile(
            leading: CircleAvatar(child: Text('A')),
            title: Text('Sandeison Silva Fernandes'),
            subtitle: Text('Matricula: 01010101'),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
           ListTile(
            leading: CircleAvatar(child: Text('A')),
            title: Text('Sandeison Silva Fernandes'),
            subtitle: Text('Matricula: 01010101'),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
           ListTile(
            leading: CircleAvatar(child: Text('A')),
            title: Text('Sandeison Silva Fernandes'),
            subtitle: Text('Matricula: 01010101'),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
        ],
      ),
    );
  }
}