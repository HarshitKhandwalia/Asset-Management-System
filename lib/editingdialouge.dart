import 'dart:convert';
import 'check.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

class mydialouge extends StatefulWidget {
  final int index1;
  const mydialouge({super.key, required this.index1});

  @override
  State<mydialouge> createState() => _mydialougeState();
}

int len = 0;
var main1;

class _mydialougeState extends State<mydialouge> {
//   final Credential = r'''
// {
//   "type": "service_account",
//   "project_id": "aawork-416505",
//   "private_key_id": "0ce63b5e1e9c1b2af6136c4809d9d6af5670f3ec",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCZvj3WSuckv5mO\nakZ2f4HZGqwmYPvZf0JZ2lC1fsy4EJwWf8dqWHknDeTfJ37d1O0LUkg0ZznORcKh\n4uCY73xjVRHEjapXjKykoWNppAw5Tl+LT2gYvXYhX1JBJzEPsIbBSUjhRqMk9m2N\nzeAYYfJo5aPThK8X9x0eaB6e3RKoEX62uMC1euNLLdclKdLN/01ktekC+b/07e80\nh+QQ3eENMa1540ueBt5P/1huv+JF+peZ0cV4RydHdgsBC36HO77LayoXvKgsK47+\naW7aoeVenUr9UiXpFjejPsEMfubkOiPd6hiKC2F6f5qLE4p1Go7Rwi5MQY5BnkMH\ni+a7Qe7pAgMBAAECggEAESN3vb6CV2KjgdB/k+ChbzwNskaP9L4+vYj8g8sDk8ZI\nPCrY5lZABTZDjAvZVO3SUfeFdJAITeIRcR37Rxk1XtZiIWzgbxuPuFeEX0eqFC5U\nMNG0i0N9mnlHkFtH2RWm4/+hJ/nJoIp3Cn6Hi3hJv19QHLl3El8aCCR3u2JuHL2Q\nQaw7c5i7uKcyZZu2qcEqQeXH/YdPhi6+P6zxew0WGwcSpHlfqs1hr4Yj0OPa0hHd\nw4xH0caXQfTHVN2FhP0NTCmOkVN8mqSHv/Xi2y0ReX4lB06L+stMki6MQ/kpdxfL\ni0Fp8vhNR8ieMiczqBO0c+lA736hPl1VnP7MM8/8jQKBgQDPfUuTO3ifhPWVtQeQ\nFC6s7nO2jo83U7b4vJKS/1mPpDq5f3trF7kr5noWahk/bH3K2Y3OGM09CCiFSYTD\n5FB6ijdDZiW/R5DzJQqQ11B1dlaYwLP0Ua85USGUJVDw39ffFTunR/HK6OZ/T3Ga\ntOltN59rLZa662PlplX7AGWRFQKBgQC9sBxBTpYyPYTzGig5walPfS/CwETl37En\nG7KX5SBgOnNMZvY+RTadOXoRY51RDtklq5k79GuyLiGq1nI+MDXMHkWmalB9HsRh\nnIjp+izSqMBo983CrM+xDCjPkiWG7bZIfxjWQAhSXg51g9r9YXI6ORdwypEdXGR3\nmKYAPhUThQKBgQCQvvC1Anzwk5mbWZGwElRJcYOprCP+zdjMBwkdoSNCkKgi9esM\nV51nIb6z2kpIs4/Brik9yJGM7R8PdK041xLJmZhZ3W2h1fQpmwKW7o4Dk41vvKcN\nXtqlWpLZPXsMvqtixfY6iXcFPZpm3+35phFdjrsY0tHfDg0/jN1YX/t6zQKBgEZQ\n0EiNPzQkhfIwEhVG6uJif5/r8h5ci6j5pXyVHSlOwYri6AkxUwt5UPy9NoXjwS8r\nq0QEWR/V5fkUQYk4Cdk+p4cHBgs7qoScqExDxvXYRGsk4Qt3UA5LeZ1oiay41ceO\nBcD2P5946lc5p6Yhx1w56ayQCrcdlsiWt4KDgQCZAoGAOG6IxUClFcT9LAJ8EBTy\nYBezW+yUcvO4vBghC/NKKH0JglGLjp4TWNLvXjFr4w7skjLAC0j+QDUtzNxZPUtT\nUue68rAEHTDdDxRnAGSdrjXx08zPzAmPF0JeQrNJ6nZ4PGSByJAN1WZp1e5Qn0vj\n2QAU4d5yVbvrJEAwWHSD/BM=\n-----END PRIVATE KEY-----\n",
//   "client_email": "harshit-khandwalia@aawork-416505.iam.gserviceaccount.com",
//   "client_id": "112378007861655225358",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/harshit-khandwalia%40aawork-416505.iam.gserviceaccount.com",
//   "universe_domain": "googleapis.com"
// }
// ''';
//   final Spreadsheetid = '1MnzcBmVCh7GmjeMFfurbtu6cgcu87YUs8PdpibTwnZo';
  List<List<String>> rows = [[]];
  var sheet;
  Future getdata() async {
    final _gsheets = GSheets(Credential);
    final ss = await _gsheets.spreadsheet(Spreadsheetid);
    sheet = ss.worksheetByTitle('Sheet1');
    rows = (await sheet!.values.allRows());
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    rows.remove(0);
    final controller = TextEditingController();
    return AlertDialog(
      content: Container(
          height: 250,
          child: Column(
            children: [
              const Text(
                "MARK THE ASSET AS : ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      sheet.values.insertValue('Available',
                          column: 3, row: widget.index1+1);
                    });
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("status updated")));
                    setState(() {
                      getdata();
                    });
                  },
                  child: const Text("Available")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      sheet.values.insertValue('Reserved',
                          column: 3, row: (widget.index1+1));
                    });
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("status updated")));
                    setState(() {
                      getdata();
                    });
                  },
                  child: const Text("Reserved")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      sheet.values
                          .insertValue('Sold', column: 3, row: widget.index1+1);
                    });
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("status updated")));
                    setState(() {
                      getdata();
                    });
                  },
                  child: Text("Sold"))
            ],
          )),
    );
  }
}
