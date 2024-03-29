import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'canteen_model.dart';
export 'canteen_model.dart';

class CanteenWidget extends StatefulWidget {
  const CanteenWidget({super.key});

  @override
  State<CanteenWidget> createState() => _CanteenWidgetState();
}

class _CanteenWidgetState extends State<CanteenWidget> {
  late CanteenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CanteenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultj4q = await CanteenCall.call();
      if ((_model.apiResultj4q?.succeeded ?? true)) {
        setState(() {
          FFAppState().jsondata = CanteenCall.items(
            (_model.apiResultj4q?.jsonBody ?? ''),
          )!
              .toList()
              .cast<dynamic>();
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).whiteBg,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).whiteBg,
        automaticallyImplyLeading: false,
        title: Text(
          'Canteen',
          style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.5,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (getRemoteConfigBool('ad'))
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  child: FlutterFlowAdBanner(
                    height: 60.0,
                    showsTestAd: false,
                    iOSAdUnitID: 'ca-app-pub-3991707481593664/9600187683',
                    androidAdUnitID: 'ca-app-pub-3991707481593664/2257448627',
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: FlutterFlowChoiceChips(
                  options: const [
                    ChipData('Biryani\'s'),
                    ChipData('Chinese'),
                    ChipData('Non-Veg Starters'),
                    ChipData('Tandoori Starters'),
                    ChipData('Veg Starters'),
                    ChipData('Non-Veg Main course'),
                    ChipData('Veg Main course'),
                    ChipData('Ice Creams'),
                    ChipData('Breads')
                  ],
                  onChanged: (val) => setState(
                      () => _model.choiceChipsValue = val?.firstOrNull),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).primaryText,
                    iconSize: 0.0,
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).alternate,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 18.0,
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  chipSpacing: 12.0,
                  rowSpacing: 12.0,
                  multiselect: false,
                  initialized: _model.choiceChipsValue != null,
                  alignment: WrapAlignment.start,
                  controller: _model.choiceChipsValueController ??=
                      FormFieldController<List<String>>(
                    ['Biryani\'s'],
                  ),
                  wrapped: true,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final info = functions
                        .jsonfilter(FFAppState().jsondata.toList(),
                            _model.choiceChipsValue)
                        .toList();
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(info.length, (infoIndex) {
                        final infoItem = info[infoIndex];
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                getJsonField(
                                  infoItem,
                                  r'''$.name''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 15.0, 0.0),
                              child: Text(
                                '₹${getJsonField(
                                  infoItem,
                                  r'''$.price''',
                                ).toString()}',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        );
                      })
                          .divide(const SizedBox(height: 25.0))
                          .around(const SizedBox(height: 25.0)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
