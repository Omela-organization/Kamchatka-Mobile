import 'package:flutter/material.dart';
import 'package:green_app/features/places/ui/place_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
    required this.placeModels,
  });

  final List<PlaceModel> placeModels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: ListView.builder(
        itemCount: placeModels.length,
        // separatorBuilder: (_, __) {
        //   return SizedBox(
        //     height: 20,
        //   );
        // },
        itemBuilder: (context, idx) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(placeModels[idx].title),
              Image.network(placeModels[idx].imageUri.toString()),
            ]),
          );
          //   CachedNetworkImage(
          //   height: MediaQuery.of(context).size.height/2,
          //         width: 20,
          //         imageUrl: placeModels[idx].imageUri.toString(),
          //   errorWidget: (context, url, error) => Icon(Icons.error),
          //
          //
          // );
          //   Container(
          //   height: 20,
          //   width: 20,
          //   color: idx.isEven ? Colors.red : Colors.black,
          // );
          //   SizedBox(
          //   height: 20,
          //   width: 20,
          //   child: CachedNetworkImage(
          //     imageUrl: placeModels[idx].imageUri.toString(),
          //   ),
          // );
        },
      ),
    );
  }
}
