import '/flutter_flow/flutter_flow_util.dart';
import 'auth1_widget.dart' show Auth1Widget;
import 'package:flutter/material.dart';

class Auth1Model extends FlutterFlowModel<Auth1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for fi widget.
  FocusNode? fiFocusNode;
  TextEditingController? fiController;
  String? Function(BuildContext, String?)? fiControllerValidator;
  // State field(s) for la widget.
  FocusNode? laFocusNode;
  TextEditingController? laController;
  String? Function(BuildContext, String?)? laControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for emailaddresspw widget.
  FocusNode? emailaddresspwFocusNode;
  TextEditingController? emailaddresspwController;
  String? Function(BuildContext, String?)? emailaddresspwControllerValidator;
  // State field(s) for passwordlogin widget.
  FocusNode? passwordloginFocusNode;
  TextEditingController? passwordloginController;
  late bool passwordloginVisibility;
  String? Function(BuildContext, String?)? passwordloginControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordloginVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    fiFocusNode?.dispose();
    fiController?.dispose();

    laFocusNode?.dispose();
    laController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    emailaddresspwFocusNode?.dispose();
    emailaddresspwController?.dispose();

    passwordloginFocusNode?.dispose();
    passwordloginController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
