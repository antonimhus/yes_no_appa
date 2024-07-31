
import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_asnwer.dart';
import 'package:yes_no_app/domain/entities/message.dart';


class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAsnwer getYesNoAsnwer= GetYesNoAsnwer();

List <Message> messageList = [
  Message(fromwho: Fromwho.me, text: 'Hi love'),
  Message(fromwho: Fromwho.me,text:'Are you back from work?' )
];

  Future <void> sendMessage (String text) async {
    if (text.isEmpty) return;

   final newMessage = Message (text: text, fromwho: Fromwho.me);
   messageList.add(newMessage);

  if (text.endsWith('?')) {
    await hisReply();  }

   notifyListeners();
   moveScrollToBottom();
  }
  Future <void> hisReply () async {

      final hisMessage = await getYesNoAsnwer.getAsnwer();
      messageList.add(hisMessage);
      notifyListeners();
    
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
       duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut); 
  }



}