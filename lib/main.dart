import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:HalamanTugas()));
}

class HalamanTugas extends StatefulWidget{
  @override
  State<HalamanTugas> createState() => _HalamanTugasState();
}

class _HalamanTugasState extends State<HalamanTugas>{
  List <String> _daftarTugas = [];
  List <bool> _sudahSelesai = [];
  TextEditingController _inputTugas = TextEditingController();

  void _tambahTugas(){
   String teksTugas = _inputTugas.text.trim();
   if (teksTugas.isEmpty){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content : Text('Isi Tugas Duluuu')));
    return;
   }

   setState((){
      _daftarTugas.add(teksTugas);
      _sudahSelesai.add(false);
   });
    _inputTugas.clear();
  }

  
  @override 
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Tugas')),
      body : Column(
        children : [
          Text('Jumlah Tugas : ${_daftarTugas.length}'),
          TextField(controller: _inputTugas, decoration:InputDecoration(hintText: 'Tulis tugas disini euy') ),
          ElevatedButton(onPressed: _tambahTugas,
          child : Text('Simpan')),

          Expanded(
            child: ListView.builder(
              itemCount: _daftarTugas.length,
              itemBuilder: (context,index){
                return ListTile(
                  leading: Checkbox(value : _sudahSelesai[index],
                  onChanged: (nilaiBaru){
                    setState((){
                      _sudahSelesai[index] = nilaiBaru!;
                    });
                  }),
                  title: Text(_daftarTugas[index],
                  style: TextStyle(decoration: _sudahSelesai[index]? TextDecoration.lineThrough:TextDecoration.none,),
                   ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState((){
                        _daftarTugas.removeAt(index);
                        _sudahSelesai.removeAt(index);
                      });
                    },
                  ),              
                );
              }
            )
          )
        ]
      )
    );
  }

  
}

