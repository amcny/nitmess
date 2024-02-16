import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'canteen_widget.dart' show CanteenWidget;
import 'package:flutter/material.dart';

class CanteenModel extends FlutterFlowModel<CanteenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Canteen)] action in canteen widget.
  ApiCallResponse? apiResultj4q;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
