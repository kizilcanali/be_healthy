import 'package:flutter/material.dart';

class CustomProfileParameterEditCard extends StatefulWidget {
  final String textValue;
  final String topic;
  final Function stateChanger;
  CustomProfileParameterEditCard(
      {this.topic, this.textValue, this.stateChanger});

  @override
  _CustomProfileParameterEditCardState createState() =>
      _CustomProfileParameterEditCardState();
}

class _CustomProfileParameterEditCardState
    extends State<CustomProfileParameterEditCard> {
  String newTarget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newTarget = widget.textValue;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            //padding: EdgeInsets.symmetric(horizontal: 80),
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Positioned(
            top: 50,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: SizedBox(
                width: 180,
                child: TextFormField(
                  onChanged: (newTargetAtFunc) {
                    setState(() {
                      newTarget = newTargetAtFunc;
                    });
                  },
                  initialValue: widget.textValue,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 115,
            child: Text(
              widget.topic,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 290,
            child: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                widget.stateChanger(int.parse(newTarget));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      "SUCCESSFULL!",
                      style: TextStyle(
                          color: Color(0xFFD14818),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    duration: Duration(milliseconds: 2000),
                    //padding: EdgeInsets.symmetric(horizontal: 35.0),
                  ),
                );
                //print("profile yazılan hedef: $newTarget");
              },
            ),
          ),
        ],
      ),
    );
  }
}
