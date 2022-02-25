import 'package:intl/intl.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:screenshot/screenshot.dart';

class invit extends StatefulWidget{
  @override
  State<invit> createState() => _invit();
}

class _invit extends State<invit> {

  var timeController=TextEditingController();
  var dateConttroller=TextEditingController();
  final screenshotconttroller = ScreenshotController();
  GlobalKey previewContainer = new GlobalKey();
  int originalSize = 800;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: Colors.grey[700],
        //centerTitle: true,
        title: Text(
          'Invitation Card',
          style: TextStyle(color: Colors.white,
              fontSize: 30.0,
          ),

        ),
        actions: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),

              child: Container(
                color: Colors.green[300],
                width: 100,

                child:
                TextButton(
                  onPressed: () async {
                    ShareFilesAndScreenshotWidgets().shareScreenshot(
                        previewContainer,
                        800,
                        "Title",
                        "Name.jpg",
                        "image/jpg",
                        text: "This is the caption!");
                  },

                  child: Text('Share',
                    style: TextStyle(fontSize: 20.0,color: Colors.grey[700]),

                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            RepaintBoundary(
              key: previewContainer,

              child: Expanded(
                child: Container(

                  child: Center(
                    child: Column(
                      children: [
                        Text('دعوة حضور',style: TextStyle(fontSize: 50,color: Colors.black, fontFamily: 'Jannah')),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: [

                            Flexible(
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                    hintText: 'name ',
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.lightBlueAccent)
                                    )
                                ),
                                style: TextStyle(color: Colors.black ,fontSize: 35.0 ,fontFamily: 'Jannah')
                                ,
                              ),
                            ),
                            Text('/عزيزي', style: TextStyle(color: Colors.black ,fontSize: 35.0 ,fontFamily: 'Jannah')),
                          ],
                        ),
                      ),
                        Text('يسرنا دعوتكم لهذا الحدث ', style: TextStyle(color: Colors.black ,fontSize: 35.0 ,fontFamily: 'Jannah')),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 35,left: 20),
                              child: Container(
                                color: Colors.white,
                                width: double.infinity ,
                                alignment: Alignment.centerRight,
                                child: Text('  مع / داش  ', style: TextStyle(color: Colors.black ,fontSize: 35.0 ,fontFamily: 'Jannah'
                                )),
                              ),
                            ),
                            CircleAvatar(
                                radius: 70,
                                backgroundImage: AssetImage('assets/images/dash.jpg'),
                            ),


                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              Container(
                                width: 180,
                                height: 50,
                                child: Flexible(
                                  child: TextFormField (

                                    textAlign: TextAlign.center,
                                    controller:  dateConttroller,

                                    keyboardType: TextInputType.datetime,
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2022-11-01'),
                                      ).then((value) {
                                        dateConttroller.text= DateFormat.yMMMd().format(value!);
                                      });

                                    },

                                    decoration: InputDecoration(
                                        hintText: 'day',
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.lightBlueAccent)
                                        )
                                    ),
                                    style: TextStyle(color: Colors.black ,fontSize: 25.0 ,)
                                    ,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.today_outlined,
                                color: Colors.black,
                                size: 30.0,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,

                          children: [
                            Flexible(
                              child: Container(
                                height: 50,
                                width: 180,
                                child: TextFormField (
                                  textAlign: TextAlign.center,
                                  controller:  timeController,

                                  keyboardType: TextInputType.datetime,
                                  onTap: () {

                                    showTimePicker(context: context,
                                      initialTime: TimeOfDay.now(),).then(
                                            (value)
                                        {
                                          timeController.text=value!.format(context).toString();
                                        }
                                    );
                                  },

                                  decoration: InputDecoration(
                                      hintText: ' time',
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.lightBlueAccent)
                                      )
                                  ),
                                  style: TextStyle(color: Colors.black ,fontSize: 25.0 ,)
                                  ,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.access_time_outlined,
                              color: Colors.black,
                              size: 30.0,
                            ),

                          ],
                        ),
                      ],

                    )
                  ),

                  color: Colors.lightBlueAccent,
                  //width: 400,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 270,
             // width: 200,
            ),
          ],
        ),
      ),



    )
    ;
  }
}