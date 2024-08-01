import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTwoWaySelection extends StatefulWidget {
  CustomTwoWaySelection(
      {super.key,
      required this.fieldText,
      required this.targetBool,
      required this.onChanged,
      this.pretext,
      this.trueText,
      this.falseText});

  final String fieldText;
  final String? pretext;
  bool? targetBool;
  final Function(bool) onChanged;
  final String? trueText;
  final String? falseText;

  @override
  State<CustomTwoWaySelection> createState() => _CustomTwoWaySelectionState();
}

class _CustomTwoWaySelectionState extends State<CustomTwoWaySelection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldText,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.redAccent,
            fontWeight: FontWeight.w500,
          ),
        ),
        widget.pretext == null
            ? const SizedBox(
                height: 10,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.pretext ?? ""),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.targetBool = true;
                      widget.onChanged(true);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: (widget.targetBool == null)
                            ? Colors.transparent
                            : widget.targetBool!
                                ? Colors.redAccent
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.redAccent, width: 1)),
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8, left: 6, right: 2),
                            child: Text(
                              widget.trueText ?? "Yes",
                              style: GoogleFonts.poppins(
                                  color: widget.targetBool == null
                                      ? Colors.black
                                      : widget.targetBool!
                                          ? Colors.white
                                          : Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.targetBool = false;
                    widget.onChanged(false);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: widget.targetBool == null
                          ? Colors.transparent
                          : (widget.targetBool!
                              ? Colors.transparent
                              : Colors.redAccent),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.redAccent, width: 1)),
                  height: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 6, right: 2),
                          child: Text(
                            widget.falseText ?? "No",
                            style: GoogleFonts.poppins(
                                color: widget.targetBool == null
                                    ? Colors.black
                                    : widget.targetBool!
                                        ? Colors.black
                                        : Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ))
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
      ],
    );
  }
}
