import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CategorizedListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorized ListView'),
      ),
      body: FutureBuilder(
        future: _getCategorizedData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<dynamic> categorizedData = snapshot.data!;
            return ListView.builder(
              itemCount: categorizedData.length,
              itemBuilder: (context, index) {
                var data = categorizedData[index];
                if (data is CategoryAData) {
                  return ListTile(
                    title: Text(data.field),
                    subtitle: Text('Category A'),
                  );
                } else if (data is CategoryBData) {
                  return ListTile(
                    title: Text(data.field),
                    subtitle: Text('Category B'),
                  );
                }
                return SizedBox.shrink();
              },
            );
          }
        },
      ),
    );
  }

  Future<List<dynamic>> _getCategorizedData() async {
    List<dynamic> categorizedData = [];

    // Fetch data from Firestore collection
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('DesignDataFromAdmin')
        .get();

    // Separate data into different categories
    querySnapshot.docs.forEach((doc) {
      var category = doc.get('houseType');
      if (category == 'Simplex') {
        categorizedData.add(CategoryAData(field: doc.get('houseType')));
      } else if (category == 'Bungalow') {
        categorizedData.add(CategoryBData(field: doc.get('houseType')));
      }
    });

    return categorizedData;
  }
}

class CategoryAData {
  final String field;

  CategoryAData({required this.field});
}

class CategoryBData {
  final String field;

  CategoryBData({required this.field});
}

