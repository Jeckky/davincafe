import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:davincafe/provider/local_storage.dart';
import 'package:provider/provider.dart';

class AuthProvider {
  void logout(BuildContext context) async {
    await LocalStorage.instance.setBooleanValue("isLogin", false);

    //final branch = await LocalStorage.instance.getJson("branch");

    // await LocalStorage.instance.removeValue("branch");
    // await LocalStorage.instance.removeValue("ip1");
    // await LocalStorage.instance.removeValue("ip2");
    // await LocalStorage.instance.removeValue("isAutoPrint");
    await LocalStorage.instance.removeValue("tokenData");
    await LocalStorage.instance.removeValue("expToken");

    DefaultCacheManager().emptyCache();
    imageCache.clear();
    imageCache.clearLiveImages();

    // context
    //     .read<GlobalKey<NavigatorState>>()
    //     .currentState!
    //     .pushNamedAndRemoveUntil(
    //       LoginScreen.routeName,
    //       (route) => false,
    //     );
  }

  void login(BuildContext context) async {
    await LocalStorage.instance.setBooleanValue("isLogin", true);
    // context
    //     .read<GlobalKey<NavigatorState>>()
    //     .currentState!
    //     .popAndPushNamed(MenuChanel.routeName);
  }
}
