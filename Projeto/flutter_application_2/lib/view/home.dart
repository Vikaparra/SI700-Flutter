// ignore: file_names
import 'package:flutter/material.dart';

class TelaInicialCuidador extends StatelessWidget {
  const TelaInicialCuidador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 25.0),
        height: MediaQuery.of(context).size.height * 1,
        color: const Color(0xff6a9cfd),
        // decoration: const BoxDecoration(
        //   color: Color(0xff6a9cfd),
        // ),
        child: Column(
          children: const [
            SizedBox(
                width: double.infinity,
                height: 100,
                child: DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontFamily: "Comfortaa"),
                  child: Text(
                    """ALARMES\nPERDIDOS""",
                    textAlign: TextAlign.center,
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Hello World!'),
            ),
          ],
        ),
      ),
    );
  }
}
