import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  File? _selectedImage;
  String _ticketText = "Your Text Here";

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ticket Generator")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: CustomPaint(
                size: const Size(350, 150),
                painter: TicketPainter(_selectedImage, _ticketText),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: "Enter Ticket Text",
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  _ticketText = text;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: _pickImage,
            child: const Text("Upload Image"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class TicketPainter extends CustomPainter {
  final File? image;
  final String text;

  TicketPainter(this.image, this.text);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paintRed = Paint()..color = Colors.red;
    final Paint paintWhite = Paint()..color = Colors.white;
    final Paint paintDivider = Paint()
      ..color = Colors.white
      ..strokeWidth = 3;

    Path ticketPath = Path();
    double notchSize = 12;
    double notchSpacing = 18;

    // Draw left perforated edge
    ticketPath.moveTo(0, 0);
    for (double i = 0; i < size.height; i += notchSpacing) {
      ticketPath.lineTo(0, i);
      ticketPath.arcToPoint(Offset(0, i + notchSize),
          radius: Radius.circular(notchSize), clockwise: false);
    }

    // Draw bottom edge
    ticketPath.lineTo(0, size.height);
    ticketPath.lineTo(size.width, size.height);

    // Draw right perforated edge
    for (double i = size.height; i > 0; i -= notchSpacing) {
      ticketPath.lineTo(size.width, i);
      ticketPath.arcToPoint(Offset(size.width, i - notchSize),
          radius: Radius.circular(notchSize), clockwise: false);
    }

    ticketPath.lineTo(size.width, 0);
    ticketPath.close();

    // Draw red ticket shape
    canvas.drawPath(ticketPath, paintRed);

    // Draw white section on the left (for image)
    double whiteWidth = size.width * 0.3;
    Rect whiteRect = Rect.fromLTWH(0, 0, whiteWidth, size.height);
    canvas.drawRect(whiteRect, paintWhite);

    // Draw white divider line
    canvas.drawLine(
        Offset(whiteWidth + 10, size.height / 2),
        Offset(size.width - 10, size.height / 2),
        paintDivider);

    // Load and draw the image inside the white area
    if (image != null) {
      ui.decodeImageFromList(image!.readAsBytesSync(), (ui.Image img) {
        final paintImage = Paint();
        final srcRect = Rect.fromLTWH(0, 0, img.width.toDouble(), img.height.toDouble());
        final dstRect = Rect.fromLTWH(10, 10, whiteWidth - 20, size.height - 20);
        canvas.drawImageRect(img, srcRect, dstRect, paintImage);
      });
    }

    // Draw text on the red area
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout(minWidth: 0, maxWidth: size.width * 0.6);
    textPainter.paint(canvas, Offset(size.width * 0.4, size.height / 2 - 15));
  }

  @override
  bool shouldRepaint(TicketPainter oldDelegate) {
    return oldDelegate.image != image || oldDelegate.text != text;
  }
}
// class Test extends StatefulWidget {
//   const Test({super.key});

//   @override
//   State<Test> createState() => _TestState();
// }

// bool? val;

// class _TestState extends State<Test> {
//   initdata() async {
//     val = await checkInternet();
//     print("are mobile is connect with internet: $val");
//   }

//   @override
//   void initState() {
//     initdata();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OTP Text Field Example'),
//       ),
//       body: OtpTextField(
//         numberOfFields: 5,
//         fieldWidth: 50.0,
//         borderRadius: BorderRadius.circular(12),
//         borderColor: Color(0xFF512DA8),
//         //set to true to show as box or false to show as dash
//         showFieldAsBox: true,
//         //runs when a code is typed in
//         onCodeChanged: (String code) {
//           //handle validation or checks here
//         },
//         //runs when every textfield is filled
//         onSubmit: (String verificationCode) {
//           // showDialog(
//           //     context: context,
//           //     builder: (context){
//           //     return AlertDialog(
//           //         title: Text("Verification Code"),
//           //         content: Text('Code entered is $verificationCode'),
//           //     );
//           //     }
//           // );
//         }, // end onSubmit
//       ),
//     );
//   }
// }
