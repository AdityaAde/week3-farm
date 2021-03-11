import 'package:farm/model/galeri_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GaleriPage extends StatelessWidget {
  var apiURL = 'apifarm.000webhostapp.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<List>(
          future: Galeri().getGaleri(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ItemList(list: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Detail(list, index);
              }));
            },
            child: Container(
              height: 100,
              child: Card(
                elevation: 5.0,
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 10, 3),
                  title: Text(
                    list[index]['judul'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        fontSize: 30),
                  ),
                  trailing: Image.network(
                    'http://apifarm.000webhostapp.com' + list[index]['gambar'],
                    fit: BoxFit.cover,
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class Detail extends StatelessWidget {
  List list;
  int index;
  Detail(this.list, this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(list[index]['judul']), backgroundColor: Colors.blue),
      body: ListView(
        children: <Widget>[
          Image.network(
              'http://apifarm.000webhostapp.com' + list[index]['gambar']),
          Container(
            padding: EdgeInsets.all(32.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          list[index]['judul'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.blue,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(32.0),
            child: Text(
              list[index]['isi'],
              softWrap: true,
              style: TextStyle(fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}
