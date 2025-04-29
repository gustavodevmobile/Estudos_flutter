import 'package:flutter/material.dart';

class StorageScreen extends StatelessWidget {
  StorageScreen({super.key});
  String? urlImage;
  List<String> listFiles = [];

  uploadImage() {}

  reload() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foto de Perfil'),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.upload, color: Colors.white,),),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.refresh, color: Colors.white,))],
      ),
      body: Container(
        margin: EdgeInsets.all(32),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            (urlImage != null)
                ? Image.network(urlImage!)
                : const CircleAvatar(
                    radius: 64,
                    child: Icon(Icons.person),
                  ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Divider(
                color: Colors.black,
              ),
            ),
            Text(
              'Histórico de imagens',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              children: List.generate(listFiles.length, (index) {
                String url = listFiles[index];
                return Image.network(url);
              }),
            )
          ],
        ),
      ),
    );
  }
}
