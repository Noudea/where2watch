import 'package:flutter/material.dart';
import 'package:where2watchapp/ui/widgets/provider.dart';

class ProvidersList extends StatelessWidget {
  const ProvidersList({required this.title,required this.providerList, Key? key }) : super(key: key);
  final List providerList;
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headline3),
        SizedBox(
          height: 150,
          child: ListView.separated(
            itemBuilder: (context, index) {
              final Map location = providerList[index];
              return Provider(provider: location);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: providerList.length,
            scrollDirection: Axis.horizontal
          ),
        )
      ]
    );
  }
}