import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  getdata? lan;
  bool status = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  loaddata() async {
    final Headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var url =
        Uri.parse('https://www.admin.raghuveergroup.com/getallcategory.php');
    var response = await http.post(url);

    debugPrint(response.body);
    var l = jsonDecode(response.body);
    print(l);
    lan = getdata.fromJson(l);
    print("hello");
    status = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              title: Image(image: AssetImage("images/Mv Bit.png")),
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                )
              ]),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                        hintText: "Search",hintStyle: TextStyle(color: Colors.black),
                        suffixIcon: Icon(Icons.search,color: Colors.black,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black,width: 25),
                        ),
                      ),
                    ),
                  ),SizedBox(height: 15,),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: lan?.msg?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Container(
                          width: 125,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)
                                ),
                                child: Container(
                                  decoration: BoxDecoration(color: Colors.black,
                                    borderRadius: BorderRadius.circular(30),
                                   image: DecorationImage(
                                       image: NetworkImage("${lan?.msg![index].imageUrl}"),
                                       fit: BoxFit.fill),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 125,
                                      ),
                                      //SvgPicture.network("${lan?.msg![index].imageUrl}")
                                      Text("${lan?.msg![index].category}",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                  ),

                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class getdata {
  String? code;
  List<Msg>? msg;

  getdata({this.code, this.msg});

  getdata.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['msg'] != null) {
      msg = <Msg>[];
      json['msg'].forEach((v) {
        msg!.add(new Msg.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.msg != null) {
      data['msg'] = this.msg!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Msg {
  String? id;
  String? category;
  String? imageUrl;

  Msg({this.id, this.category, this.imageUrl});

  Msg.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
