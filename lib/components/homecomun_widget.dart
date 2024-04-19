import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'homecomun_model.dart';
export 'homecomun_model.dart';

class HomecomunWidget extends StatefulWidget {
  const HomecomunWidget({super.key});

  @override
  State<HomecomunWidget> createState() => _HomecomunWidgetState();
}

class _HomecomunWidgetState extends State<HomecomunWidget> {
  late HomecomunModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomecomunModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: GetAllCommunesCall.call(
        wilaya: FFAppState().selectedWilaya,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitCircle(
                color: Color(0xFFF4CA00),
                size: 50.0,
              ),
            ),
          );
        }
        final containerGetAllCommunesResponse = snapshot.data!;
        return Container(
          height: MediaQuery.sizeOf(context).height * 0.4,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(18.0),
              topRight: Radius.circular(18.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 24.0, 16.0, 24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Select commune',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleLargeFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleLargeFamily),
                                ),
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.hDropDownValueController ??=
                              FormFieldController<String>(null),
                          options: GetAllCommunesCall.allCommunes(
                            containerGetAllCommunesResponse.jsonBody,
                          )!,
                          onChanged: (val) =>
                              setState(() => _model.hDropDownValue = val),
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          hintText: 'Please select commune ...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 50.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() {
                        FFAppState().selectedCommune = _model.hDropDownValue!;
                      });
                      _model.calculateFees = await CalculateTotalFeesCall.call(
                        cartIdsList: FFAppState().cartItemsIds,
                        cartQtysList: FFAppState().cartItemsQtys,
                        firstname: FFAppState().FirstName,
                        lastname: FFAppState().LastName,
                        phone: FFAppState().PhoneNumber,
                        wilaya: FFAppState().selectedWilaya,
                        commune: FFAppState().selectedCommune,
                        stopdesk: FFAppState().selectedStopdesk,
                        isStopdesk: FFAppState().isStopDesk,
                      );
                      if ((_model.calculateFees?.succeeded ?? true)) {
                        FFAppState().update(() {
                          FFAppState().showClientDataPrompt = false;
                          FFAppState().DeliveryFees = valueOrDefault<double>(
                            CalculateTotalFeesCall.deliveryFees(
                              (_model.calculateFees?.jsonBody ?? ''),
                            )?.toDouble(),
                            0.0,
                          );
                        });
                        Navigator.pop(
                            context,
                            CalculateTotalFeesCall.deliveryFees(
                              (_model.calculateFees?.jsonBody ?? ''),
                            )?.toDouble());

                        context.pushNamed(
                          'CheckoutPage',
                          queryParameters: {
                            'deFee': serializeParam(
                              FFAppState().DeliveryFees,
                              ParamType.double,
                            ),
                          }.withoutNulls,
                        );
                      }

                      setState(() {});
                    },
                    text: 'Submit',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleLarge
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleLargeFamily,
                            color: Colors.white,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleLargeFamily),
                          ),
                      elevation: 2.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
