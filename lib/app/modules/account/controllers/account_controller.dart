import 'package:get/get.dart';
import 'package:herdrobe_app/app/data/models/user.dart';
import 'package:herdrobe_app/app/data/services/auth_service.dart';
import 'package:herdrobe_app/app/data/services/db_service.dart';
import 'package:herdrobe_app/app/data/services/file_picker_service.dart';
import 'package:herdrobe_app/app/utils/loading_overlay.dart';
import 'package:herdrobe_app/app/widgets/bottom_sheets/edit_field_sheet.dart';

class AccountController extends GetxController {
  final authService = Get.find<AuthService>();
  final dbService = Get.find<DbService>();
  bool get isAdmin => authService.isAdmin;

  AppUser? get currentUser => authService.currentUser.value;

  changeProfile() async {
    final image = await FilePickerService.pickImage();
    if (image != null) {
      isAppLoading = true;
      final imageUrl = await dbService.uploadProfileImage(file: image);
      authService.updateProfile(currentUser!.copyWith(photoUrl: imageUrl));
      isAppLoading = false;
    }
  }

  changeName() async {
    final result = await Get.bottomSheet<String?>(
      EditFieldSheet(
        title: 'Edit Name',
        hintText: 'Enter your name',
        initialValue: currentUser?.fullName,
      ),
    );

    if (result != null && result.isNotEmpty) {
      isAppLoading = true;
      await authService.updateProfile(currentUser!.copyWith(name: result));
      isAppLoading = false;
    }
  }

  @override
  void onInit() {
    ever(authService.currentUser, (user) {
      update();
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
