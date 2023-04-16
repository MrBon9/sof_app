import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:sof_user_app/app/constant/constants.dart';

class LoadingFooter extends StatelessWidget {
  const LoadingFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      loadStyle: LoadStyle.ShowWhenLoading,
      height: AppConstant.smallSpacing * 8,
      builder: (context, status) {
        if (status == LoadStatus.loading) {
          return SizedBox(
            height: AppConstant.smallSpacing * 8,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: AppConstant.smallSpacing,
                width: AppConstant.smallSpacing,
                child: CircularProgressIndicator(
                  strokeWidth: AppConstant.largeRadius,
                ),
              ),
            ),
          );
        }

        if (status == LoadStatus.canLoading) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: AppConstant.smallSpacing),
              const Icon(Icons.arrow_upward_rounded),
              SizedBox(height: AppConstant.smallSpacing),
              const Text('Load more')
            ],
          );
        }

        if (status == LoadStatus.noMore) {
          return const SizedBox();
        }

        // if (status == LoadStatus.failed) {
        //   return const ErrorContainer(dense: true);
        // }

        return const SizedBox();
      },
    );
  }
}
