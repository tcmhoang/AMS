import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';

import '../../../config/constansts.dart';
import '../../../config/extensions.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    this.isActive = false,
    // this.item,
    required this.press,
  }) : super(key: key);

  final bool isActive;
  // final item;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: press,
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: isActive ? kPrimaryColor : kBgDarkColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          // backgroundImage: AssetImage(item.image),
                        ),
                      ),
                      const SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            // text: '${item.name} \n',
                            text: 'Asset name\n',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isActive ? Colors.white : kTextColor,
                            ),
                            children: <InlineSpan>[
                              TextSpan(
                                // text: item.subject,
                                text: 'Username',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color:
                                          isActive ? Colors.white : kTextColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            // item.time,
                            DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                                .format(DateTime.now()),
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: isActive ? Colors.white70 : null,
                                    ),
                          ),
                          const SizedBox(height: 5),
                          LineIcon.print(
                            color: isActive ? Colors.white70 : kGrayColor,
                          )

                          // )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  Text(
                    // item.body,
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          height: 1.5,
                          color: isActive ? Colors.white70 : null,
                        ),
                  )
                ],
              ),
            ).addNeumorphism(
              blurRadius: 15,
              borderRadius: 15,
              offset: const Offset(5, 5),
              topShadowColor: Colors.white60,
              bottomShadowColor: const Color(0xFF234395).withOpacity(0.15),
            ),
          ],
        ),
      ),
    );
  }
}
