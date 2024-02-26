import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ListPengajuanSkeleton extends StatelessWidget {
  const ListPengajuanSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
      height: 120,
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(color: const Color.fromARGB(158, 255, 255, 255)),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 114, 114, 114).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(3, 5), // changes position of shadow
          ),
        ],
      ),
      child: const Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SkeletonLine(),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 100,
                child: SkeletonLine(),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SkeletonLine(),
          SizedBox(height: 19),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: SkeletonLine(),
              ),
              SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 120,
                child: SkeletonLine(),
              )
            ],
          )
        ],
      ),
    );
  }
}
