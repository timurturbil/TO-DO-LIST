
import 'package:not_defteri/veritabanı/gorevler.dart';
import 'package:not_defteri/veritabanı/vtyardımcısı.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;

class AnaVeritabani extends StatefulWidget {
  @override
  _AnaVeritabaniState createState() => _AnaVeritabaniState();
}

class _AnaVeritabaniState extends State<AnaVeritabani> {
  Vtyardimcisi vtyardimcisi = Vtyardimcisi();
  List<Gorevler> gorevler = List();

  bool duzenlemi = false;
  TextEditingController textcontroller = TextEditingController();

  goreviEkle() {
    vtyardimcisi.gorevlerKaydet(Gorevler(textcontroller.text)).then((value) {
      if (value > 0) {
        listeyenile();
        textcontroller.clear();
        Navigator.pop(context);
      } 
    });
  }

  goreviSil(Gorevler grovler) {
    vtyardimcisi.gorevSil(grovler).then((value) {
      if (value > 0) {
        listeyenile();
      }
    });
  }

  goreviGuncellee(int no) {
    var gvr = Gorevler(textcontroller.text);
    gvr.no = no;
    vtyardimcisi.gorevGuncelle(gvr).then((value) {
      if (value) {
        listeyenile();
        Navigator.pop(context);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listeyenile();
  }

  listeyenile() {
    vtyardimcisi.gorevlerGetir().then((value) {
      setState(() {
        gorevler = value;
      });
    });
  }

  void eklemeveyaduzenlemeekrani({Gorevler grovler}) {
    if (grovler != null) {
      duzenlemi = true;
      textcontroller.text = grovler.gorev;
    } else {
      duzenlemi = false;
      textcontroller.clear();
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(duzenlemi ? "Düzenle" : "Ekle"),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: textcontroller,
                    decoration: InputDecoration(hintText: "görevi giriniz"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () =>
                      duzenlemi ? goreviGuncellee(grovler.no) : goreviEkle(),
                  child: Text(duzenlemi ? "düzenle" : "ekle")),
              FlatButton(
                  onPressed: () => Navigator.pop(context), child: Text("iptal"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("Not Defteri"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.plus_one),
              onPressed: () => eklemeveyaduzenlemeekrani()),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/yeni.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListView.builder(
            itemCount: gorevler.length,
            itemBuilder: (BuildContext context, int sira) {
              return Card(
                color: Colors.white24,
                              child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("${gorevler[sira].gorev}"),
                      ),
                      Row(
                        children: <Widget>[
                          FlatButton(
                              onPressed: () => eklemeveyaduzenlemeekrani(
                                  grovler: gorevler[sira]),
                              child: Text("Güncelle")),
                          FlatButton(
                              onPressed: () => goreviSil(gorevler[sira]),
                              child: Text("Sil")),
                        ],
                      )
                    ],
                  ),
              );
              
            },
          ),
        ),
      ),
    );
  }
}
