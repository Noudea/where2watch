import 'package:flutter/cupertino.dart';
import 'package:where2watchapp/ui/widgets/actor_card.dart';

class HorizontalCastList extends StatelessWidget {
  const HorizontalCastList({required this.castList, Key? key})
      : super(key: key);
  final List castList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: ListView.separated(
          itemBuilder: (context, index) {
            final Map actor = castList[index];
            return ActorCard(actor: actor);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: castList.length,
          scrollDirection: Axis.horizontal)
    );
  }
}
