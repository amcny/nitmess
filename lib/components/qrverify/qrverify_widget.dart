import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'qrverify_model.dart';
export 'qrverify_model.dart';

class QrverifyWidget extends StatefulWidget {
  const QrverifyWidget({super.key});

  @override
  State<QrverifyWidget> createState() => _QrverifyWidgetState();
}

class _QrverifyWidgetState extends State<QrverifyWidget> {
  late QrverifyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QrverifyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 410.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
              child: Container(
                width: 70.0,
                height: 3.5,
                decoration: BoxDecoration(
                  color: const Color(0x67616161),
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(1.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'QR Verification',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 18.0,
                          ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: BarcodeWidget(
                    data: currentUserUid,
                    barcode: Barcode.qrCode(),
                    width: 200.0,
                    height: 200.0,
                    color: FlutterFlowTheme.of(context).primaryText,
                    backgroundColor: Colors.transparent,
                    errorBuilder: (context, error) => const SizedBox(
                      width: 200.0,
                      height: 200.0,
                    ),
                    drawText: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
