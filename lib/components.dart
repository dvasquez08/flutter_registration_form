import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Custom widget that is called when typing black text in the app.

class textBlack extends StatelessWidget {
  final text;
  final size;
  const textBlack(this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
          fontSize: size, fontWeight: FontWeight.w400, color: Colors.black),
    );
  }
}

// Custom widget that works just like "textBlack" but with white text.

class sansText extends StatelessWidget {
  final text;
  final size;
  const sansText(this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.openSans(
          fontSize: size, fontWeight: FontWeight.w300, color: Colors.white),
    );
  }
}

// Custom widget that is called whenever a text box in the form is needed.

class textForm extends StatelessWidget {
  final text;
  final containerWidth;
  final hintText;
  final maxLines;
  final controller;
  final validator;

  const textForm(
      {Key? key,
      @required this.text,
      @required this.containerWidth,
      @required this.hintText,
      this.maxLines,
      @required this.controller,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textBlack(text, 16.0),
        SizedBox(height: 5),
        SizedBox(
          width: containerWidth,
          child: TextFormField(
            validator: validator,
            controller: controller,
            maxLines: maxLines == null ? null : maxLines,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}

// This widget was made for the dialog box that appears when the user clicks
// on the submit button at the bottom of the form.

Future DialogError(BuildContext context, String title) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text(
              title,
              style: GoogleFonts.openSans(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ));
}
