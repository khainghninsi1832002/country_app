import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_app/api/api_service.dart';
import 'package:country_app/model/country.dart';
import 'package:country_app/screen/detailScreen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatelessWidget {
  //apiservice ko homepage&detailscreen သံုးချင်လို့ global ဆောက်တာ
  ApiService apiService = ApiService(Dio());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country List'),
      ),
      body: FutureBuilder<List<Country>>(
        future: apiService.getCountries(),
        builder: (context, snapshoot) {
          if (snapshoot.hasData) {
            List<Country>? country = snapshoot.data;
            return ListView.builder(
                itemCount: country!.length,
                itemBuilder: (context, position) {
                  // return Text(country[position].cca2.toString());
                  return item(country[position], context);
                });
          } else if (snapshoot.hasError) {
            return Text('Error');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget item(Country country, BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Detailscreen(apiService, country.common.toString())));
      },
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
