import 'dart:convert';
import 'package:asset_management/editingdialouge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gsheets/gsheets.dart';

const Credential = r'''
{
  "type": "service_account",
  "project_id": "aawork-416505",
  "private_key_id": "0ce63b5e1e9c1b2af6136c4809d9d6af5670f3ec",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCZvj3WSuckv5mO\nakZ2f4HZGqwmYPvZf0JZ2lC1fsy4EJwWf8dqWHknDeTfJ37d1O0LUkg0ZznORcKh\n4uCY73xjVRHEjapXjKykoWNppAw5Tl+LT2gYvXYhX1JBJzEPsIbBSUjhRqMk9m2N\nzeAYYfJo5aPThK8X9x0eaB6e3RKoEX62uMC1euNLLdclKdLN/01ktekC+b/07e80\nh+QQ3eENMa1540ueBt5P/1huv+JF+peZ0cV4RydHdgsBC36HO77LayoXvKgsK47+\naW7aoeVenUr9UiXpFjejPsEMfubkOiPd6hiKC2F6f5qLE4p1Go7Rwi5MQY5BnkMH\ni+a7Qe7pAgMBAAECggEAESN3vb6CV2KjgdB/k+ChbzwNskaP9L4+vYj8g8sDk8ZI\nPCrY5lZABTZDjAvZVO3SUfeFdJAITeIRcR37Rxk1XtZiIWzgbxuPuFeEX0eqFC5U\nMNG0i0N9mnlHkFtH2RWm4/+hJ/nJoIp3Cn6Hi3hJv19QHLl3El8aCCR3u2JuHL2Q\nQaw7c5i7uKcyZZu2qcEqQeXH/YdPhi6+P6zxew0WGwcSpHlfqs1hr4Yj0OPa0hHd\nw4xH0caXQfTHVN2FhP0NTCmOkVN8mqSHv/Xi2y0ReX4lB06L+stMki6MQ/kpdxfL\ni0Fp8vhNR8ieMiczqBO0c+lA736hPl1VnP7MM8/8jQKBgQDPfUuTO3ifhPWVtQeQ\nFC6s7nO2jo83U7b4vJKS/1mPpDq5f3trF7kr5noWahk/bH3K2Y3OGM09CCiFSYTD\n5FB6ijdDZiW/R5DzJQqQ11B1dlaYwLP0Ua85USGUJVDw39ffFTunR/HK6OZ/T3Ga\ntOltN59rLZa662PlplX7AGWRFQKBgQC9sBxBTpYyPYTzGig5walPfS/CwETl37En\nG7KX5SBgOnNMZvY+RTadOXoRY51RDtklq5k79GuyLiGq1nI+MDXMHkWmalB9HsRh\nnIjp+izSqMBo983CrM+xDCjPkiWG7bZIfxjWQAhSXg51g9r9YXI6ORdwypEdXGR3\nmKYAPhUThQKBgQCQvvC1Anzwk5mbWZGwElRJcYOprCP+zdjMBwkdoSNCkKgi9esM\nV51nIb6z2kpIs4/Brik9yJGM7R8PdK041xLJmZhZ3W2h1fQpmwKW7o4Dk41vvKcN\nXtqlWpLZPXsMvqtixfY6iXcFPZpm3+35phFdjrsY0tHfDg0/jN1YX/t6zQKBgEZQ\n0EiNPzQkhfIwEhVG6uJif5/r8h5ci6j5pXyVHSlOwYri6AkxUwt5UPy9NoXjwS8r\nq0QEWR/V5fkUQYk4Cdk+p4cHBgs7qoScqExDxvXYRGsk4Qt3UA5LeZ1oiay41ceO\nBcD2P5946lc5p6Yhx1w56ayQCrcdlsiWt4KDgQCZAoGAOG6IxUClFcT9LAJ8EBTy\nYBezW+yUcvO4vBghC/NKKH0JglGLjp4TWNLvXjFr4w7skjLAC0j+QDUtzNxZPUtT\nUue68rAEHTDdDxRnAGSdrjXx08zPzAmPF0JeQrNJ6nZ4PGSByJAN1WZp1e5Qn0vj\n2QAU4d5yVbvrJEAwWHSD/BM=\n-----END PRIVATE KEY-----\n",
  "client_email": "harshit-khandwalia@aawork-416505.iam.gserviceaccount.com",
  "client_id": "112378007861655225358",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/harshit-khandwalia%40aawork-416505.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';
final Spreadsheetid = '1MnzcBmVCh7GmjeMFfurbtu6cgcu87YUs8PdpibTwnZo';

class StorageUpload extends StatefulWidget {
  @override
  StorageUploadState createState() => new StorageUploadState();
}

class StorageUploadState extends State<StorageUpload> {
  List<List<String>> results = [[]];
  int len = 0;
  var sheet;
  var main1;
  List<List<String>> rows = [];
  Future getdata() async {
    final _gsheets = GSheets(Credential);
    final ss = await _gsheets.spreadsheet(Spreadsheetid);
    sheet = ss.worksheetByTitle('Sheet1');
    rows = (await sheet!.values.allRows());
    rows = rows.sublist(1);
    final allRows = await sheet.values.allRows();
  }

  bool sel = false;
  bool sel1 = false;
  bool sel2 = false;
  String query = '';
  final tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    getdata();
                    print(rows);
                  });
                },
                icon: Icon(Icons.refresh))
          ],
          title: const Text(
            "Asset Management",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: tc,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Search...'),
                      onChanged: (v) {
                        setState(() {
                          query = v;
                          setResults(query);
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 50,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Filters: ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    sel1 ? sel1 = false : sel1 = true;
                                    query = "Available";
                                    setResults(query);
                                  });
                                },
                                child: Chip(
                                    color: sel1
                                        ? MaterialStateProperty.all(
                                            const Color.fromARGB(
                                                255, 138, 32, 24))
                                        : null,
                                    label: Text("Available"))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    sel2 ? sel2 = false : sel2 = true;
                                    print(sel);
                                    query = "Reserved";
                                    setResults(query);
                                    if (sel2 == false) {
                                      query = "Available";
                                      setResults(query);
                                    }
                                  });
                                },
                                child: Chip(
                                    color: sel2
                                        ? MaterialStateProperty.all(
                                            const Color.fromARGB(
                                                255, 138, 32, 24))
                                        : null,
                                    label: Text("Reserved"))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    sel ? sel = false : sel = true;
                                    query = "Sold";
                                    setResults(query);
                                    if (sel == false) {
                                      query = "Available";
                                      setResults(query);
                                    }
                                  });
                                },
                                child: Chip(
                                    color: sel
                                        ? MaterialStateProperty.all(
                                            const Color.fromARGB(
                                                255, 138, 32, 24))
                                        : null,
                                    label: Text("Sold"))),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: query.isEmpty
                          ? FutureBuilder(
                              future: getdata(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child:
                                          CircularProgressIndicator.adaptive());
                                } else {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: rows.length,
                                    itemBuilder: (con, ind) {
                                      return ListTile(
                                        title: Text(rows[ind][1]),
                                        subtitle: Text(rows[ind][2]),
                                        trailing: IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return mydialouge(
                                                    index1:
                                                        int.parse(rows[ind][0]),
                                                  );
                                                });
                                            setState(() {
                                              // getdata();
                                            });
                                          },
                                          icon: Icon(Icons.edit),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            tc.text = rows[ind][1];
                                            query = rows[ind][1];
                                            setResults(query);
                                          });
                                        },
                                      );
                                    },
                                  );
                                }
                              },
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: results.length,
                              itemBuilder: (con, ind) {
                                return ListTile(
                                  title: Text(results[ind][1]),
                                  subtitle: Text(results[ind][2]),
                                  trailing: IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return mydialouge(
                                                index1:
                                                    int.parse(results[ind][0]),
                                              );
                                            });
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.edit)),
                                  onTap: () {
                                    setState(() {
                                      tc.text = results[ind][1];
                                      query = results[ind][2];
                                      setResults(query);
                                    });
                                  },
                                );
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setResults(String query) {
    results = rows
        .where((elem) =>
            elem.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
