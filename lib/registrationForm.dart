import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dave_regform/components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class registrationForm extends StatefulWidget {
  const registrationForm({Key? key}) : super(key: key);

  @override
  State<registrationForm> createState() => _registrationFormState();
}

class _registrationFormState extends State<registrationForm> {
  static const primaryColor = Color(0xFF457b9d);
  static const secondaryColor = Color(0xFFd9d9d9);
  @override
  Widget build(BuildContext context) {
    final TextEditingController _firstNameController = TextEditingController();
    final TextEditingController _lastNameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();
    final TextEditingController _cityProvinceController =
        TextEditingController();
    final TextEditingController _postalCodeController = TextEditingController();
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    final formKey = GlobalKey<FormState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: (secondaryColor),
        appBar: AppBar(
          backgroundColor: (primaryColor),
          title: sansText("Registration Form", 20.0),
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            children: [
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 20.0),
                      textBlack("info@davtek.ca", 15.0),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 20.0),
                      textBlack("(780)-932-4435", 15.0),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.web),
                      SizedBox(width: 20.0),
                      textBlack("https://davtek.ca", 15.0),
                    ],
                  )
                ],
              ),
              SizedBox(height: 50.0),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Technology Event Presented By:",
                      style: GoogleFonts.poppins(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Image.asset(
                      "logo2.png",
                      height: heightDevice / 8,
                      width: widthDevice / 8,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Fill in your information below to register",
                      style: GoogleFonts.poppins(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        textForm(
                            text: "First Name",
                            containerWidth: 250.0,
                            hintText: "Your first name:",
                            validator: (text) {
                              if (text.toString().isEmpty) {
                                return "Field is required";
                              }
                            },
                            controller: _firstNameController),
                        textForm(
                            text: "Last Name:",
                            containerWidth: 250.0,
                            hintText: "Your last name",
                            validator: (text) {
                              if (text.toString().isEmpty) {
                                return "Field is required";
                              }
                            },
                            controller: _lastNameController),
                        textForm(
                            text: "Email Address:",
                            containerWidth: 250.0,
                            hintText: "Email address",
                            validator: (text) {
                              if (text.toString().isEmpty) {
                                return "Field is required";
                              }
                            },
                            controller: _emailController),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textForm(
                            text: "Phone number:",
                            containerWidth: 250.0,
                            hintText: "Your phone number",
                            validator: (text) {
                              if (text.toString().isEmpty) {
                                return "Field is required";
                              }
                            },
                            controller: _phoneController),
                        SizedBox(width: 15.0),
                        textForm(
                            text: "Street address:",
                            containerWidth: 450.0,
                            hintText: "Street address",
                            validator: (text) {
                              if (text.toString().isEmpty) {
                                return "Field is required";
                              }
                            },
                            controller: _addressController),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textForm(
                            text: "City/Province:",
                            containerWidth: 250.0,
                            hintText: "City and Province",
                            validator: (text) {
                              if (text.toString().isEmpty) {
                                return "Field is required";
                              }
                            },
                            controller: _cityProvinceController),
                        SizedBox(width: 15.0),
                        textForm(
                            text: "Postal Code:",
                            containerWidth: 150.0,
                            hintText: "Postal code",
                            validator: (text) {
                              if (text.toString().isEmpty) {
                                return "Field is required";
                              }
                            },
                            controller: _postalCodeController),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Column(
                      children: [
                        textBlack(
                            "The event will begin at 10:00AM and end at 4:00PM. "
                            "Lunch will be served at 12:30PM in the conference room",
                            15.0),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    MaterialButton(
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      height: 60.0,
                      minWidth: 200.0,
                      color: primaryColor,
                      onPressed: () async {
                        Map<String, String> dataToSave = {
                          'firstname': _firstNameController.text,
                          'lastname': _lastNameController.text,
                          'email': _emailController.text,
                          'phoneNumber': _phoneController.text,
                          'address': _addressController.text,
                          'city/province': _cityProvinceController.text,
                          'postalCode': _postalCodeController.text
                        };

                        if (formKey.currentState!.validate()) {
                          await FirebaseFirestore.instance
                              .collection('registrations')
                              .add(dataToSave);
                          formKey.currentState!.reset();
                          DialogError(context, "Thank you for registering!");
                        } else {
                          DialogError(context, "Information failed to send");
                        }
                      },
                      child: sansText("Submit", 15.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0)
            ],
          ),
        ),
      ),
    );
  }
}
