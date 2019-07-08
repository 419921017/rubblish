
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rubblish_app/res/resources.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget{

  const SearchBar({
    Key key,
    this.backgroundColor: Colors.white,
    this.hintText: "",
    this.onPressed,
  }): super(key: key);

  final Color backgroundColor;
  final String hintText;
  final Function(String) onPressed;
  
  @override
  _SearchBarState createState() => _SearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}

class _SearchBarState extends State<SearchBar> {

  SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle.light;
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      overlayStyle = ThemeData.estimateBrightnessForColor(widget.backgroundColor) == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark;
    });
  }

  Color getColor(){
    return overlayStyle == SystemUiOverlayStyle.light ? Colors.white : Colours.text_dark;
  }
  
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Material(
        color: widget.backgroundColor,
        child: SafeArea(
          child: Container(
            color: widget.backgroundColor,
            child: Row(
              children: <Widget>[
                Container(
                  width: 12.0,
                  height: 48.0,
                  // child: InkWell(
                  //   onTap: (){
                  //     Navigator.maybePop(context);
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(3.0),
                  //     // child: Image.asset(
                  //     //   widget.backImg,
                  //     //   color: getColor(),
                  //     // ),
                  //   ),
                  // ),
                ),
                Expanded(
                  child: Container(
                    height: 32.0,
                    decoration: BoxDecoration(
                      color: Colours.bg_gray,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: TextField(
                      // autofocus: true,
                      controller: _controller,
                      maxLines: 1,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 6.0, left: -8.0, right: -16.0),
                        border: InputBorder.none,
                        icon: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
                          child: Image.asset("assets/images/order_search.png"),
                        ),
                        hintText: widget.hintText,
                        hintStyle: TextStyles.textGrayC14,
                        suffixIcon: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                            child: Image.asset("assets/images/order_delete.png"),
                          ),
                          onTap: (){
                            _controller.text = "";
                            widget.onPressed(_controller.text);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8.0, right: 16.0),
                  height: 32.0,
                  width: 44.0,
                  child: FlatButton(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    color: Colours.app_main,
                    textColor: Colors.white,
                    onPressed:(){
                      widget.onPressed(_controller.text);
                    },
                    child: Text("搜索"),
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    )
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}
