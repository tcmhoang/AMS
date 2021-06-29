import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import '../../../config/constansts.dart';
import 'card_item.dart';

class ListOfAssets extends StatelessWidget {
  const ListOfAssets({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<int> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        color: kBgDarkColor,
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String value) {},
              decoration: InputDecoration(
                hintText: 'Search',
                fillColor: kBgLightColor,
                filled: true,
                suffixIcon: RotatedBox(
                  quarterTurns: -1,
                  child: LineIcon.search(size: 24),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            Row(
              children: <Widget>[
                LineIcon.angleDown(
                  size: 12,
                  color: Colors.black,
                ),
                const SizedBox(width: 5),
                const Text(
                  'Sort by date',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                MaterialButton(
                  minWidth: 20,
                  onPressed: () {},
                  child: LineIcon.sort(size: 16),
                ),
              ],
            ),
            const SizedBox(height: kDefaultPadding),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, int index) => CardItem(
                  isActive: index == 0,
                  // item: items[index],
                  press: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
