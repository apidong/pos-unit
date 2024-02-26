import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonHomeWelcome extends StatelessWidget {
  const SkeletonHomeWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 195,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SkeletonAvatar(
            style: SkeletonAvatarStyle(
                width: 100, height: 100, shape: BoxShape.circle),
          ),
          SizedBox(
            height: 10,
          ),
          SkeletonLine(
            style: SkeletonLineStyle(
                padding: EdgeInsets.symmetric(horizontal: 50), height: 22),
          ),
          SizedBox(
            height: 10,
          ),
          SkeletonLine(
            style: SkeletonLineStyle(
                padding: EdgeInsets.symmetric(horizontal: 50), height: 22),
          ),
          SizedBox(
            height: 10,
          ),
          SkeletonLine(
            style: SkeletonLineStyle(
                padding: EdgeInsets.symmetric(horizontal: 50), height: 22),
          ),
        ],
      ),
    );
  }
}

class SkeleteonSuratDashboard extends StatelessWidget {
  const SkeleteonSuratDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 5),
      separatorBuilder: (context, index) => const Divider(
        height: 5,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: SkeletonLine(
                      style: SkeletonLineStyle(height: 14),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    width: 100,
                    child: const SkeletonLine(
                      style: SkeletonLineStyle(height: 14),
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 3),
                alignment: Alignment.centerLeft,
                child: const SkeletonLine(
                  style: SkeletonLineStyle(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
