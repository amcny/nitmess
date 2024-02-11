import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'homepage_model.dart';
export 'homepage_model.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({super.key});

  @override
  State<HomepageWidget> createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget>
    with TickerProviderStateMixin {
  late HomepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().messname == '') {
        context.pushNamed('ChooseMess');
      } else {
        return;
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: min(
          valueOrDefault<int>(
            () {
              if (functions.timebreakfast(getCurrentTimestamp)) {
                return 0;
              } else if (functions.timelunch(getCurrentTimestamp)) {
                return 1;
              } else if (functions.timesnacks(getCurrentTimestamp)) {
                return 2;
              } else if (functions.timedinner(getCurrentTimestamp)) {
                return 3;
              } else {
                return 1;
              }
            }(),
            0,
          ),
          3),
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).whiteBg,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FFAppState().clearHomepageCache();
          FFAppState().clearIndexpageCache();
          FFAppState().clearMenupageCache();
          FFAppState().update(() {});
        },
        backgroundColor: FlutterFlowTheme.of(context).primary,
        elevation: 8.0,
        child: const Icon(
          Icons.refresh_rounded,
          color: Colors.white,
          size: 26.0,
        ),
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/images/LOGO.png'
                        : 'assets/images/LOGODARK.png',
                    width: 135.0,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FlutterFlowExpandedImageView(
                                image: Image.asset(
                                  'assets/images/ps_icon.png',
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: 'imageTag2',
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: 'imageTag2',
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: Image.asset(
                              'assets/images/ps_icon.png',
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        functions.wishes(),
                        'Wishes',
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 23.0,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Hope you are having Great Day',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: Lottie.asset(
                          'assets/lottie_animations/star-struck_lottie.json',
                          height: 25.0,
                          fit: BoxFit.cover,
                          animate: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (getRemoteConfigBool('ad'))
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 10.0),
                child: FlutterFlowAdBanner(
                  height: 60.0,
                  showsTestAd: false,
                  iOSAdUnitID: 'ca-app-pub-3991707481593664/9600187683',
                  androidAdUnitID: 'ca-app-pub-3991707481593664/2257448627',
                ),
              ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      functions.day(),
                      'Display Day',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<MessRecord>>(
                stream: FFAppState().homepage(
                  requestFn: () => queryMessRecord(
                    queryBuilder: (messRecord) => messRecord
                        .where(
                          'day',
                          isEqualTo: functions.day(),
                        )
                        .where(
                          'messname',
                          isEqualTo: FFAppState().messname,
                        ),
                    singleRecord: true,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: SpinKitThreeBounce(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 30.0,
                        ),
                      ),
                    );
                  }
                  List<MessRecord> tabBarMessRecordList = snapshot.data!;
                  final tabBarMessRecord = tabBarMessRecordList.isNotEmpty
                      ? tabBarMessRecordList.first
                      : null;
                  return Column(
                    children: [
                      Align(
                        alignment: const Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                  ),
                          unselectedLabelStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                  ),
                          indicatorColor: FlutterFlowTheme.of(context).primary,
                          padding: const EdgeInsets.all(4.0),
                          tabs: const [
                            Tab(
                              text: 'Breakfast',
                            ),
                            Tab(
                              text: 'Lunch',
                            ),
                            Tab(
                              text: 'Snacks',
                            ),
                            Tab(
                              text: 'Dinner',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [
                              () async {},
                              () async {},
                              () async {},
                              () async {}
                            ][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0x4C1A73E8),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 15.0, 20.0, 15.0),
                                        child: Text(
                                          tabBarMessRecord!.breakfast,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                                lineHeight: 2.5,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0x4C1A73E8),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 15.0, 20.0, 15.0),
                                        child: Text(
                                          tabBarMessRecord.lunch,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                                lineHeight: 2.5,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0x4C1A73E8),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 15.0, 20.0, 15.0),
                                        child: Text(
                                          tabBarMessRecord.snacks,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                                lineHeight: 2.5,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0x4C1A73E8),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 15.0, 20.0, 15.0),
                                        child: Text(
                                          tabBarMessRecord.dinner,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                                lineHeight: 2.5,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
