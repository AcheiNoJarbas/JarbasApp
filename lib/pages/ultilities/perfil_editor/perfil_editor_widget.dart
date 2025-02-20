import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/buttons/jarbas_large_button/jarbas_large_button_widget.dart';
import '/golbal_components/forms/input_banner/input_banner_widget.dart';
import '/golbal_components/forms/input_foto_circle/input_foto_circle_widget.dart';
import '/golbal_components/forms/input_phone/input_phone_widget.dart';
import '/golbal_components/forms/input_text/input_text_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'perfil_editor_model.dart';
export 'perfil_editor_model.dart';

class PerfilEditorWidget extends StatefulWidget {
  const PerfilEditorWidget({super.key});

  static String routeName = 'perfilEditor';
  static String routePath = '/perfilEditor';

  @override
  State<PerfilEditorWidget> createState() => _PerfilEditorWidgetState();
}

class _PerfilEditorWidgetState extends State<PerfilEditorWidget> {
  late PerfilEditorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilEditorModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.nomeModel.textController?.text = currentUserDisplayName;
      });
      safeSetState(() {
        _model.emailModel.textController?.text = currentUserEmail;
      });
      safeSetState(() {
        _model.inputPhoneModel.textController?.text = currentPhoneNumber;
        _model.inputPhoneModel.textFieldMask.updateMask(
          newValue: TextEditingValue(
            text: _model.inputPhoneModel.textController!.text,
          ),
        );
      });
      _model.reload = true;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: Color(0x00FFFFFF),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 40.0, 10.0, 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 100.0,
                        fillColor: Color(0x27000000),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(PerfilDoUserWidget.routeName);
                        },
                      ),
                      Text(
                        'Editar Perfil',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: Colors.black,
                              fontSize: 25.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                  Expanded(
                    child: ClipRRect(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => wrapWithModel(
                                  model: _model.inputFotoCircleModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: InputFotoCircleWidget(
                                    url:
                                        '${valueOrDefault(currentUserDocument?.imageUrl, '')}',
                                    label: 'Sua foto de perfil:',
                                  ),
                                ),
                              ),
                              AuthUserStreamWidget(
                                builder: (context) => wrapWithModel(
                                  model: _model.inputBannerModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: InputBannerWidget(
                                    url: valueOrDefault(
                                        currentUserDocument?.imageUrl, ''),
                                    label: 'Seu banner de usuário:',
                                  ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.nomeModel,
                                updateCallback: () => safeSetState(() {}),
                                child: InputTextWidget(
                                  label: 'Seu Nome de usuário:',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.emailModel,
                                updateCallback: () => safeSetState(() {}),
                                child: InputTextWidget(
                                  label: 'Seu email:',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.inputPhoneModel,
                                updateCallback: () => safeSetState(() {}),
                                child: InputPhoneWidget(
                                  label: 'Seu telefone:',
                                  action: () async {
                                    safeSetState(() {
                                      _model.inputPhoneModel.textController
                                              ?.text =
                                          functions.formatToPhoneNumber(_model
                                              .inputPhoneModel
                                              .textController
                                              .text);
                                      _model.inputPhoneModel.textFieldMask
                                          .updateMask(
                                        newValue: TextEditingValue(
                                          text: _model.inputPhoneModel
                                              .textController!.text,
                                        ),
                                      );
                                    });
                                  },
                                ),
                              ),
                            ].divide(SizedBox(height: 15.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.jarbasLargeButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: JarbasLargeButtonWidget(
                      textButton: 'Salvar alterações',
                      buttonAction: () async {
                        _model.fotoUrl = await action_blocks.uploadMedia(
                          context,
                          uploadFile: _model.inputFotoCircleModel.upload,
                          hasUploadFile:
                              (_model.inputFotoCircleModel.uploadedLocalFile
                                          .bytes?.isNotEmpty ??
                                      false),
                          bucketName: 'perfilUser',
                          folderName: 'fotoUser',
                        );
                        _model.bannerUrl = await action_blocks.uploadMedia(
                          context,
                          uploadFile: _model.inputBannerModel.uploadFile,
                          hasUploadFile:
                              _model.inputBannerModel.uploadFile != null &&
                                  (_model.inputBannerModel.uploadFile?.bytes
                                          ?.isNotEmpty ??
                                      false),
                          bucketName: 'perfilUser',
                          folderName: 'bannerUser',
                        );

                        await currentUserReference!.update(createUserRecordData(
                          email: currentUserEmail,
                          displayName: _model.nomeModel.textController.text,
                          imageUrl:
                              _model.inputFotoCircleModel.upload != null &&
                                      (_model.inputFotoCircleModel.upload?.bytes
                                              ?.isNotEmpty ??
                                          false)
                                  ? _model.fotoUrl
                                  : valueOrDefault(
                                      currentUserDocument?.imageUrl, ''),
                          bannerUrl:
                              _model.inputBannerModel.uploadFile != null &&
                                      (_model.inputBannerModel.uploadFile?.bytes
                                              ?.isNotEmpty ??
                                          false)
                                  ? _model.bannerUrl
                                  : valueOrDefault(
                                      currentUserDocument?.bannerUrl, ''),
                          phoneNumber:
                              _model.inputPhoneModel.textController.text,
                        ));
                        _model.reload = true;
                        safeSetState(() {});
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Perfil atualizado!'),
                              content: Text(
                                  'Seu perfil foi atualizado com sucesso!'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );

                        safeSetState(() {});
                      },
                    ),
                  ),
                ].divide(SizedBox(height: 15.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
