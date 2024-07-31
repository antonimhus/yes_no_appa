import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged <String> onValue;

  const MessageFieldBox({super.key,
  required this.onValue});

  @override
  Widget build(BuildContext context) {

    final FocusNode focusNode= FocusNode();
    // ignore: non_constant_identifier_names
    final OutlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide( color: Colors.transparent),
        borderRadius:  BorderRadius.circular(20)
    );

  const hintStyle = TextStyle(
          color: Colors.black38, 
          fontStyle: FontStyle.normal,
          decorationStyle: TextDecorationStyle.dashed,
          fontSize: 18,
          letterSpacing: 2,
         fontWeight: FontWeight.w400);
  final textController = TextEditingController();

    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      controller: textController,
      focusNode: focusNode,
      decoration:  InputDecoration(
        constraints: BoxConstraints.tight(Size(350, 55)),
        hintText: 'End your message with a "?"',
       hintStyle: hintStyle , 
        enabledBorder: OutlineInputBorder,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10),
        suffixIcon: IconButton(onPressed: () {
          final textValue= textController.value.text;
          textController.clear();
          onValue (textValue);
        }, 
        icon: const Icon(Icons.send_outlined))
      ),
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
        },



    );
  }
}