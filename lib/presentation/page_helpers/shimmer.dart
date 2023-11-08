import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class CustomShimmer extends StatelessWidget {

  final double width;
  final double height;
  final int itemCount;
  const CustomShimmer({super.key, required this.width, required this.height, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Container(
        margin: const EdgeInsets.only(
            right: 10,
            left: 10,
            top: 10,
            bottom: 10
        ),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.only(
                    bottom: 5,
                    top: 5
                ),
                child: Shimmer.fromColors(
                  direction: ShimmerDirection.rtl,
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        width: width - width / 1.2 - 20,
                        height: height / 40,
                      ),
                      const SizedBox(width: 5,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        width: width / 1.5,
                        height: height / 40,
                      ),

                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
