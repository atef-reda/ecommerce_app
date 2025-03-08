import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});
  final StatusRequest statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return Center(
        child: Lottie.asset(AppImageAsset.loading,height: 250,width: 250)
      );
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Center(
        child:Lottie.asset(AppImageAsset.offline,height: 250,width: 250),
      );
    }
    else if (statusRequest == StatusRequest.serverfailure) {
      return Center(
        child: Lottie.asset(AppImageAsset.server,height: 250,width: 250),
      );
    }else if (statusRequest == StatusRequest.failure) {
      return Center(
        child: Lottie.asset(AppImageAsset.noData,height: 250,width: 250),
      );
    }
    return widget;
  }
}





class HandlingDataRequest extends StatelessWidget {
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});
  final StatusRequest statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return Center(
        child: Lottie.asset(AppImageAsset.loading,height: 250,width: 250)
      );
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Center(
        child:Lottie.asset(AppImageAsset.offline,height: 250,width: 250),
      );
    }
    else if (statusRequest == StatusRequest.serverfailure) {
      return Center(
        child: Lottie.asset(AppImageAsset.server,height: 250,width: 250),
      );
    }
    return widget;
  }
}

