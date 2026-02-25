import 'package:flutter/material.dart';
import 'package:flutter_ppkd/Tugas%209/list_data_kesehatan.dart';

class ModulPage extends StatelessWidget {
  const ModulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataKesehatan.length,
      itemBuilder: (BuildContext context, int index) {
        final data = dataKesehatan[index];
        return Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 4,
                offset: Offset(0, 4)
              )
            ]
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8),
              child: Image.network(
                data.image ?? '',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              // backgroundImage: NetworkImage(data.image ?? ''),
            ),
            title: Text(data.title ?? ''),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.description ?? ''),
                SizedBox(height: 10,),
                Text(
                  "jumlah Obat: ${data.medications?.length ?? 0}"
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}