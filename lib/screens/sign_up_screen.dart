import 'package:designanddio/service/validator_service.dart';
import 'package:flutter/material.dart';

import '../models/customer.dart';
import '../service/api_service.dart';
import '../widgets/form_helper.dart';
import '../widgets/progress_hud.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late APIService apiService;
  late CustomerModel model;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool isApiCallProcess = false;

  @override
  void initState() {
    apiService = APIService();
    model = CustomerModel(
      email: "",
      firstName: "",
      lastName: "",
      password: "",
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: true,
        title: const Text("Sign Up"),
      ),
      body: ProgressHud(
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        child: Form(
          key: globalKey,
          child: _formUI(),
        ),
      ),
    );
  }

  Widget _formUI() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHelper.fieldLabel("First Name"),
                FormHelper.textInput(
                  context,
                  model.firstName,
                  (value) => {
                    model.firstName = value,
                  },
                  onValidate: (value) {
                    if (value.toString().isEmpty) {
                      return ' Please enter First Name';
                    }
                    return null;
                  },
                ),
                FormHelper.fieldLabel("Last Name"),
                FormHelper.textInput(
                  context,
                  model.lastName,
                  (value) => {
                    model.lastName = value,
                  },
                  onValidate: (value) {
                    if (value.toString().isEmpty) {
                      return ' Please enter Last Name';
                    }
                    return null;
                  },
                ),
                FormHelper.fieldLabel("Email ID"),
                FormHelper.textInput(
                  (context),
                  model.email,
                  (value) => {
                    model.email = value,
                  },
                  onValidate: (value) {
                    if (value.toString().isEmpty) {
                      return ' Please enter Email ID';
                    }
                    if (value.isNotEmpty && !value.toString().isValidEmail()) {
                      return 'Please enter valid email id';
                    }
                    return null;
                  },
                ),
                FormHelper.fieldLabel("Password"),
                FormHelper.textInput(
                  context,
                  model.password,
                  (value) => {
                    model.password = value,
                  },
                  onValidate: (value) {
                    if (value.toString().isEmpty) {
                      return ' Please enter Password';
                    }
                    return null;
                  },
                  obscureText: hidePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.4),
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: FormHelper.saveButton(
                    "Register",
                    () {
                      if (validateAndSave()) {
                        print(model.toJson());
                        setState(() {
                          isApiCallProcess = true;
                        });

                        apiService.createCustomer(model).then(
                          (ret) {
                            setState(() {
                              isApiCallProcess = false;
                            });
                            if (ret) {
                              FormHelper.showMessage(
                                context,
                                "WooCommece App",
                                "Register Sucessful",
                                "OK",
                                () {
                                  Navigator.of(context).pop();
                                },
                              );
                            } else {
                              FormHelper.showMessage(
                                context,
                                "WooCommece App",
                                "Email ID already Registered",
                                "OK",
                                () {
                                  Navigator.of(context).pop();
                                },
                              );
                            }
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
