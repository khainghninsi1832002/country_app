import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_app/api/api_service.dart';
import 'package:country_app/model/country.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country List'),
      ),
      body: FutureBuilder<List<Country>>(
        future: ApiService(Dio()).getCountries(),
        builder: (context, snapshoot) {
          if (snapshoot.hasData) {
            List<Country>? country = snapshoot.data;
            return ListView.builder(
                itemCount: country!.length,
                itemBuilder: (context, position) {
                  // return Text(country[position].cca2.toString());
                  return item(country[position]);
                });
          } else if (snapshoot.hasError) {
            return Text('Error');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget item(Country country) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: 'https://flagsapi.com/${country.cca2}/flat/64.png',
        width: 100,
        height: 100,
        placeholder: (_, __) => Center(child: CircularProgressIndicator()),
      ),
      title: Text(
        country.common.toString(),
      ),
      subtitle: Text(country.region.toString()),
    );
  }
}
