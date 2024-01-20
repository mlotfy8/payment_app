import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';


class AnimateContainer extends StatefulWidget {
  const AnimateContainer({super.key, });

  @override
  State<AnimateContainer> createState() => _AnimateContainerState();
}

class _AnimateContainerState extends State<AnimateContainer> {
  @override
  int activeindex=0;
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(onTap: (){
            setState(() {
              activeindex=index;
            });
          },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              child: Container(
                height: 62,
                width: 103,
                child: Center(child: SvgPicture.asset('${images[index]}')),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              width: 103,
              height: 62,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1.50,
                      color: activeindex == index ? Color(0xFF34A853) : Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: [
                  BoxShadow(
                    color: activeindex == index  ? Color(0xFF34A853) : Colors.white,
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> images = [
  'assetes/SVGRepo_iconCarrier.svg',
  'assetes/Group.svg',
  'assetes/apple.svg'
];
