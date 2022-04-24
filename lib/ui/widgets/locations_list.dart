import 'package:flutter/cupertino.dart';
import 'package:where2watchapp/ui/widgets/providers_list.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({required this.locations, Key? key }) : super(key: key);
  final Map locations;
  

  @override
  Widget build(BuildContext context) {
  List stream = locations["flatrate"] ?? [];
  List buy = locations["buy"] ?? [];
  List rent = locations["rent"] ?? [];

    return Column(
      children: [
        if(stream.isNotEmpty) ProvidersList(title: "Stream", providerList: stream),
        if (buy.isNotEmpty) ProvidersList(title : 'Buy', providerList: buy),
        if (rent.isNotEmpty) ProvidersList(title: 'Rent', providerList: rent),
      ],
    );
  }
}