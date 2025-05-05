import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_app/api/api_service.dart';
import 'package:country_app/model/detail.dart';
import 'package:flutter/material.dart';

class Detailscreen extends StatelessWidget {
  final ApiService apiService;
  final String? country_name;

  Detailscreen(this.apiService, this.country_name);

  @override
  Widget build(BuildContext context) {
    //print(country_name);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail List'),
      ),
      body: FutureBuilder<List<Detail>>(
        future: apiService.getDetail(country_name ?? ''), // Handle null case
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No details available'));
          }

          // If we have data, display it
          Detail detail = snapshot.data![0];
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Center(
                child: Text(
                  detail.common.toString(),
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Region: ${detail.region.toString()}',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Subregion: ${detail.subregion.toString()}',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Population: ${detail.population.toString()}',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Demonyms: ${detail.demonyms.toString()}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              CachedNetworkImage(
                imageUrl: 'https://flagsapi.com/${detail.cca2}/flat/64.png',
                width: 300,
                height: 300,
                fit: BoxFit.fill,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ],
          );
        },
      ),
    );
  }
}
      // body: FutureBuilder<List<Detail>>(
      //   future: apiService.getDetail(country_name.toString()),
      //   builder: (context, snapshoot) {
      //     if (snapshoot.hasData) {
      //       Detail detail = snapshoot.data![0];
      //       return ListView(
      //         children: [
      //           Center(
      //               child: Text(
      //             '${detail.common.toString()}',
      //             style: TextStyle(
      //               fontSize: 25,
      //             ),
      //           )),
      //           Text(
      //             'region : ${detail.region.toString()}',
      //             style: TextStyle(
      //               fontSize: 20,
      //             ),
      //           ),
      //           Text(
      //             'subregion : ${detail.subregion.toString()}',
      //             style: TextStyle(
      //               fontSize: 20,
      //             ),
      //           ),
      //           Text(
      //             'Population : ${detail.population.toString()}',
      //             style: TextStyle(
      //               fontSize: 20,
      //             ),
      //           ),
      //           Text(
      //             'Demonyms : ${detail.demonyms.toString()}',
      //             style: TextStyle(
      //               fontSize: 20,
      //             ),
      //           ),
      //           CachedNetworkImage(
      //             imageUrl: 'https://flagsapi.com/${detail.cca2}/flat/64.png',
      //             width: 300,
      //             height: 300,
      //             fit: BoxFit.fill,
      //             placeholder: (_, __) => Center(
      //               child: CircularProgressIndicator(),
      //             ),
      //           )
      //         ],
      //       );
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
