import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoremIpsumWithHeader extends StatelessWidget {
  final String header;
  const LoremIpsumWithHeader({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 7.0, // Blur amount
              offset: Offset(0, 4.0),
              blurStyle: BlurStyle.normal),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style:
                  GoogleFonts.roboto(fontSize: 50, fontWeight: FontWeight.w600),
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam "
              "hendrerit quis purus non efficitur. Suspendisse potenti. Donec "
              "quis tellus posuere diam ultrices congue. Nunc quam tortor, "
              "tincidunt in erat sed, posuere molestie tellus.",
              style:
                  GoogleFonts.roboto(fontSize: 18, fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
