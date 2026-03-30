import 'package:flutter/material.dart';
import 'package:flutter_ppkd/Tugas_14/api/get_data.dart';

class GetGameOfThronesData extends StatefulWidget {
  const GetGameOfThronesData({super.key});

  @override
  State<GetGameOfThronesData> createState() => _GetGameOfThronesDataState();
}

class _GetGameOfThronesDataState extends State<GetGameOfThronesData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final users = snapshot.data;
            return ListView.builder(
              itemCount: users?.length,
              itemBuilder: (BuildContext context, int index) {
                final items = users?[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(items?.imageUrl ?? ""),
                  ),
                  title: Text(
                    "${items?.firstName ?? ""} ${items?.lastName ?? ""}",
                  ),
                  subtitle: Text(items?.family ?? ""),
                );
              },
            );
          } else {
            return Text("Gagal Memuat Data");
          }
        },
      ),
    );
  }
}
