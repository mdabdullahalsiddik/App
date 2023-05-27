import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:note_pad/static/All_Colors.dart';

import '../static/All_Icons.dart';
import '../static/All_Texts.dart';
import '../widgets/alertdialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  List<String> name = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColor.redcolor,
        elevation: 0.0,
        leading: AllIcon.bookicon,
        title: AllText.titletext,
        titleSpacing: 0.0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Cost_AlertDialog(
                      controller: controller,
                      onpass: () {
                        setState(() {
                          name.add(controller.text);
                          controller.clear();
                          Navigator.pop(context);
                        });
                      },
                      botton: AllText.savetext,
                    );
                  },
                );
              },
              child: AllIcon.add_icon,
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
            itemCount: name.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: AllColor.redcolor,
                    border: Border.all(width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text(name[index]),
                  trailing: Container(
                    width: 60.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Cost_AlertDialog(
                                  controller: controller,
                                  onpass: () {
                                    setState(() {
                                      name[index] = controller.text;
                                      controller.clear();
                                      Navigator.pop(context);
                                    });
                                  },
                                  botton: AllText.updatetext,
                                );
                              },
                            );
                          },
                          child: AllIcon.eidt_icon,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              name.removeAt(index);
                            });
                          },
                          child: AllIcon.delet_icon,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
