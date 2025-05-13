import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/constants/firebase_const.dart';
import 'package:herdrobe_app/app/routes/app_pages.dart';

import '../controllers/wrapper_controller.dart';

class WrapperView extends GetView<WrapperController> {
  const WrapperView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WrapperController>(
      builder: (controller) {
        if (controller.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator.adaptive()),
          );
        }

        if (controller.isLoggedIn) {
          final showCompletionPage = controller.displayName != kUserCompleted;

          if (showCompletionPage) {
            return GetRouterOutlet(initialRoute: Routes.PROFILE_COMPLETION);
          }
          return GetRouterOutlet(initialRoute: Routes.NAVIGATION);
        } else {
          return GetRouterOutlet(initialRoute: Routes.LOGIN);
        }
      },
    );
  }
}


// StreamBuilder(
//             stream: controller.authStateChanges,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Scaffold(
//                   body: Center(child: CircularProgressIndicator.adaptive()),
//                 );
//               } else if (snapshot.connectionState == ConnectionState.active) {
//                 if (snapshot.hasError) {
//                   return const Scaffold(
//                     body: Center(child: Text('Something went wrong')),
//                   );
//                 } else if (snapshot.hasData && snapshot.data != null) {
//                   final showCompletionPage =
//                       snapshot.data?.displayName == kUserCompleteProfile;

//                   if (controller.isLoading) {
//                     return const Scaffold(
//                       body: Center(child: CircularProgressIndicator.adaptive()),
//                     );
//                   }

//                   if (showCompletionPage) {
//                     return GetRouterOutlet(
//                       initialRoute: Routes.PROFILE_COMPLETION,
//                     );
//                   }
//                   return GetRouterOutlet(initialRoute: Routes.NAVIGATION);
//                 } else {
//                   return GetRouterOutlet(initialRoute: Routes.LOGIN);
//                 }
//               } else if (snapshot.connectionState == ConnectionState.done) {
//                 return const Scaffold(
//                   body: Center(
//                     child: CircularProgressIndicator(color: Colors.red),
//                   ),
//                 );
//               } else {
//                 return const Scaffold(
//                   body: Center(child: Text('Something went wrong')),
//                 );
//               }
//             },
//           ),