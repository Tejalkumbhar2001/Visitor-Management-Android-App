import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocation/widgets/textfielddecoration.dart';
import 'package:stacked/stacked.dart';
import '../../../router.router.dart';
import '../../../widgets/drop_down.dart';
import '../../../widgets/full_screen_loader.dart';
import '../../../widgets/text_button.dart';
import 'add_team_model.dart';

class AddTeamMember extends StatefulWidget {
  final String memberid;
  const AddTeamMember({super.key, required this.memberid});

  @override
  State<AddTeamMember> createState() => _AddTeamMemberState();
}

class _AddTeamMemberState extends State<AddTeamMember> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Addteammembermodel>.reactive(
        viewModelBuilder: () => Addteammembermodel(),
        onViewModelReady: (model) => model.initialise(context, widget.memberid),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: const Text('Team Member'),
            ),
            body: WillPopScope(
              onWillPop: ()  async{
    Navigator.popAndPushNamed(context, Routes.teamMemberList);
    return true; },
              child: fullScreenLoader(
                child: SingleChildScrollView(
                    child: Form(
                        key: model.formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(children: [
                            TextFormField(
                              controller: model.firstnamecontroller,
                              decoration: AppInputDecorations.textFieldDecoration(
                                  labelText: 'First Name',
                                  hintText: 'john',
                                  prefixIcon: Icons.person),
                              onChanged: model.setname,
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter a First Name'
                                  : null,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: model.lastnamecontroller,
                              decoration: AppInputDecorations.textFieldDecoration(
                                  labelText: 'Last Name',
                                  hintText: 'Snow',
                                  prefixIcon: Icons.person),
                              onChanged: model.setlastname,
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter a last Name'
                                  : null,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                                controller: model.emailcontroller,
                                decoration:
                                    AppInputDecorations.textFieldDecoration(
                                        labelText: 'Email Address',
                                        hintText: 'example@gmail.com',
                                        prefixIcon: Icons.email),
                                onChanged: model.setemail,
                                validator: (value) => value!.isEmpty
                                    ? 'Please enter a email'
                                    : null),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                                controller: model.mobilecontroller,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                decoration:
                                    AppInputDecorations.textFieldDecoration(
                                        labelText: 'Mobile',
                                        hintText: '0123456789',
                                        prefixIcon: Icons.phone),
                                onChanged: model.setmobile,
                                validator: (value) => value!.isEmpty
                                    ? 'Please enter a mobile'
                                    : null),
                            const SizedBox(
                              height: 15,
                            ),
                            CdropDown(
                              dropdownButton: DropdownButtonFormField<String>(
                                menuMaxHeight: 200,
                                isExpanded: true,
                                value: model.addmemberdata.role,
                                // Replace null with the selected value if needed
                                decoration: const InputDecoration(
                                  labelText: 'Role Profile',
                                ),
                                hint: const Text('Select Role Profile'),
                                items: model.rolelist.map((val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: AutoSizeText(val),
                                  );
                                }).toList(),
                                onChanged: model.setrole,
                                validator: model.validaterole,
                              ),
                            ),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // Expanded(
                            //   child: TextFormField(
                            //     key: Key(model.addmemberdata.company ??
                            //         "cropVariety"),
                            //     initialValue:
                            //         model.addmemberdata.company ?? "",
                            //     decoration: const InputDecoration(
                            //       labelText: 'company',
                            //     ),
                            //     onChanged: model.setname,
                            //   ),
                            // ),
                            // const SizedBox(
                            //   width: 25,
                            // ),
                            CdropDown(
                              dropdownButton: DropdownButtonFormField<String>(
                                menuMaxHeight: 200,
                                isExpanded: true,
                                value: model.addmemberdata.designation,
                                // Replace null with the selected value if needed
                                decoration: const InputDecoration(
                                  labelText: 'Designation',
                                ),
                                hint: const Text('Select Designation'),
                                items: model.designationlist.map((val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: AutoSizeText(val),
                                  );
                                }).toList(),
                                onChanged: model.setdesignation,
                                validator: model.validatedesignation,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                                controller: model.passwordcontroller,
                                obscureText: model.obscurePassword,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  hintText: "*********",
                                  prefixIcon: Icon(Icons.password_outlined),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        model.obscurePassword =
                                            !model.obscurePassword;
                                      });
                                    },
                                    child: Icon(
                                      model.obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onChanged: model.setpassword,
                                validator: (value) => value!.isEmpty
                                    ? 'Please enter a password'
                                    : null),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: model.confirmpasswordcontroller,
                              obscureText: model.obscureconfirmPassword,
                              decoration: InputDecoration(
                                labelText: "Confirm Password",
                                prefixIcon: Icon(Icons.password_outlined),
                                hintText: "*********",
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      model.obscureconfirmPassword =
                                          !model.obscureconfirmPassword;
                                    });
                                  },
                                  child: Icon(
                                    model.obscureconfirmPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onChanged: model.setconfirmpass,
                              validator: model.validateconfirmpassword,
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            if(model.isEdit == false)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CtextButton(
                                  onPressed: () => model.onsaved(context),
                                  text: 'Save',
                                ),
                                CtextButton(
                                  text: 'Cancel',
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            ),
                          ]),
                        ))),
                loader: model.isBusy,
                context: context,
              ),
            )));
  }
}
