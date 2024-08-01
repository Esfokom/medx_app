import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

import '../CustomMethods/Validation_Methods.dart';

class TelephoneField extends StatefulWidget {
  TelephoneField(
      {super.key,
      required this.fieldText,
      required this.hintText,
      required this.textEditingController,
      this.onTap,
      this.focusable,
      this.onChanged,
      this.icon,
      required this.preText});

  final String hintText;
  final String fieldText;
  final TextEditingController textEditingController;
  final Function()? onTap;
  final Function()? onChanged;
  final bool? focusable;
  final Icon? icon;
  final String preText;

  @override
  State<TelephoneField> createState() => _TelephoneFieldState();
}

class _TelephoneFieldState extends State<TelephoneField> {
  final FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();

  final TextEditingController _countryEditingController =
      TextEditingController(text: "+233");

  final TextEditingController _numberEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.preText),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: ValidationMethods.isValidPhoneNumber(
                          widget.textEditingController.text)
                      ? Colors.green
                      : Colors.red,
                  width: 1)),
          height: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.fieldText,
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 6, right: 2),
                child: Row(
                  children: [
                    Expanded(
                      flex: 25,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextField(
                            textAlign: TextAlign.end,
                            onTap: () {
                              countryCodePicker
                                  .showPicker(
                                      context: context,
                                      initialSelectedLocale: "GH")
                                  .then((value) {
                                setState(() {
                                  _countryEditingController.text =
                                      value!.dialCode;
                                });
                              }).then((value) {
                                setState(() {
                                  widget.textEditingController.text =
                                      "${_countryEditingController.text}"
                                      "${_numberEditingController.text}";
                                  widget.onChanged!();
                                });
                              });
                            },
                            canRequestFocus: false,
                            controller: _countryEditingController,
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            decoration: InputDecoration(
                              icon: widget.icon ?? const Icon(Icons.phone),
                              filled: false,
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                    const VerticalDivider(
                      width: 2,
                      thickness: 3,
                      indent: 5,
                      endIndent: 5,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 70,
                      child: TextField(
                        canRequestFocus: true,
                        onChanged: (value) {
                          setState(() {
                            widget.onChanged!();
                            widget.textEditingController.text =
                                "${_countryEditingController.text}${_numberEditingController.text}";
                          });
                        },
                        keyboardType: TextInputType.phone,
                        controller:
                            _numberEditingController ?? TextEditingController(),
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                        decoration: InputDecoration(
                          filled: false,
                          border: InputBorder.none,
                          hintText: widget.hintText,
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ],
    );
  }
}
