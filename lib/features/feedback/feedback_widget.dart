import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'feedback_model.dart';
export 'feedback_model.dart';

class FeedbackWidget extends StatefulWidget {
  const FeedbackWidget({super.key});

  @override
  State<FeedbackWidget> createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  late FeedbackModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Feedback',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 0.0, 15.0),
                        child: RichText(
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Student: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              TextSpan(
                                text: currentUserEmail,
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 0.0, 25.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Food',
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18.0,
                                    ),
                          ),
                          Flexible(
                            child: Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 15.0, 0.0),
                                child: RatingBar.builder(
                                  onRatingUpdate: (newValue) {
                                    setState(() =>
                                        _model.ratingBarValue1 = newValue);
                                    HapticFeedback.selectionClick();
                                  },
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: FlutterFlowTheme.of(context).warning,
                                  ),
                                  direction: Axis.horizontal,
                                  initialRating: _model.ratingBarValue1 ??= 3.0,
                                  unratedColor:
                                      FlutterFlowTheme.of(context).accent3,
                                  itemCount: 5,
                                  itemSize: 40.0,
                                  glowColor:
                                      FlutterFlowTheme.of(context).warning,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 0.0, 25.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Service',
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18.0,
                                    ),
                          ),
                          Flexible(
                            child: Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 15.0, 0.0),
                                child: RatingBar.builder(
                                  onRatingUpdate: (newValue) {
                                    setState(() =>
                                        _model.ratingBarValue2 = newValue);
                                    HapticFeedback.selectionClick();
                                  },
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: FlutterFlowTheme.of(context).warning,
                                  ),
                                  direction: Axis.horizontal,
                                  initialRating: _model.ratingBarValue2 ??= 3.0,
                                  unratedColor:
                                      FlutterFlowTheme.of(context).accent3,
                                  itemCount: 5,
                                  itemSize: 40.0,
                                  glowColor:
                                      FlutterFlowTheme.of(context).warning,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 0.0, 25.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Hygiene',
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18.0,
                                    ),
                          ),
                          Flexible(
                            child: Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 15.0, 0.0),
                                child: RatingBar.builder(
                                  onRatingUpdate: (newValue) {
                                    setState(() =>
                                        _model.ratingBarValue3 = newValue);
                                    HapticFeedback.selectionClick();
                                  },
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: FlutterFlowTheme.of(context).warning,
                                  ),
                                  direction: Axis.horizontal,
                                  initialRating: _model.ratingBarValue3 ??= 3.0,
                                  unratedColor:
                                      FlutterFlowTheme.of(context).accent3,
                                  itemCount: 5,
                                  itemSize: 40.0,
                                  glowColor:
                                      FlutterFlowTheme.of(context).warning,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Feedback',
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.normal,
                              ),
                          alignLabelWithHint: false,
                          hintText:
                              'Share details of your own experience of\nthis particular meal',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w300,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontWeight: FontWeight.normal,
                            ),
                        maxLines: null,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 25.0, 15.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          HapticFeedback.selectionClick();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(24.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: Icon(
                                  Icons.add_a_photo_outlined,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 22.0,
                                ),
                              ),
                              Text(
                                'Add Photos ( if necessary )',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 5.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      HapticFeedback.selectionClick();
                    },
                    text: 'Submit',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 47.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
