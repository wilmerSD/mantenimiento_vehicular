import 'package:app_valtx_asistencia/app/ui/components/skeleton/button_slkeleton.dart';
import 'package:app_valtx_asistencia/app/ui/components/skeleton/datatable_skeleton.dart';
import 'package:app_valtx_asistencia/app/ui/components/skeleton/search_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonStaff extends StatelessWidget {
  const SkeletonStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.25),
          highlightColor: Colors.white.withOpacity(0.6),
          period: const Duration(seconds: 2),
          child: Column(
            children: [
              const SearchSkeleton(
                isMaxHeight: 100,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: const Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children:  [
                          Expanded(
                            flex: 3,
                            child: ButtonSlkeleton(),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                            flex: 3,
                            child: ButtonSlkeleton(),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                            flex: 3,
                            child: ButtonSlkeleton(),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                            flex: 3,
                            child: ButtonSlkeleton(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 2, child: SizedBox())
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const DatatableSkeleton()
            ],
          ),
        )
      ],
    );
  }
}
