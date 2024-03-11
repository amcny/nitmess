import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nodetails/nodetails_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'feedbackpage_model.dart';
export 'feedbackpage_model.dart';

class FeedbackpageWidget extends StatefulWidget {
  const FeedbackpageWidget({super.key});

  @override
  State<FeedbackpageWidget> createState() => _FeedbackpageWidgetState();
}

class _FeedbackpageWidgetState extends State<FeedbackpageWidget> {
  late FeedbackpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackpageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).whiteBg,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).whiteBg,
          automaticallyImplyLeading: false,
          title: Text(
            'Feedbacks',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.5,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<FeedbackRecord>>(
            stream: queryFeedbackRecord(
              queryBuilder: (feedbackRecord) => feedbackRecord
                  .where(
                    'uid',
                    isEqualTo: currentUserUid,
                  )
                  .orderBy('timestamp'),
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
              List<FeedbackRecord> listViewFeedbackRecordList = snapshot.data!;
              if (listViewFeedbackRecordList.isEmpty) {
                return const Center(
                  child: NodetailsWidget(),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewFeedbackRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewFeedbackRecord =
                      listViewFeedbackRecordList[listViewIndex];
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 0.8,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0x4C1A73E8),
                                      borderRadius: BorderRadius.circular(14.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 3.0, 10.0, 3.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          listViewFeedbackRecord.fbDoc.radio,
                                          'Pending',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    dateTimeFormat('MMMEd',
                                            listViewFeedbackRecord.timestamp!)
                                        .maybeHandleOverflow(
                                      maxChars: 30,
                                      replacement: '…',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Session: ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      TextSpan(
                                        text: listViewFeedbackRecord.session,
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Description: ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            listViewFeedbackRecord.description,
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Management: ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          listViewFeedbackRecord.fbDoc.mgmt,
                                          'Response from the management side is pending',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
