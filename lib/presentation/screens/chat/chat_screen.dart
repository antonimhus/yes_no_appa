import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/his_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

  class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding (padding: EdgeInsets.all(4.0),
       child: CircleAvatar(
        backgroundImage: NetworkImage('https://img.redbull.com/images/c_crop,x_1005,y_0,h_3712,w_3712/c_fill,w_350,h_350/q_auto:low,f_auto/redbullcom/2022/5/10/hop9yksneuaqtv4coxri/sergio-perez-portrait-imola-gp-f1-2022'),
       )
       ),
       title: const Text('Íl preñatore💦'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child:Padding(padding: const EdgeInsets.symmetric(
        horizontal: 10),
       child: Column(
        children: [

        Expanded(child:ListView.builder(
          controller: chatProvider.chatScrollController,
          itemCount: chatProvider.messageList.length,
          itemBuilder: (context, index){
            final message = chatProvider.messageList[index];
            
            return(message.fromwho == Fromwho.his)
            ? HisMessagesBubble (message : message )
            : MyMessageBubble( message : message);
         
          })
          ),

        /// Text box by chat
         MessageFieldBox(onValue: (String value) => chatProvider.sendMessage(value), ),
        
      ],) )
      ,
      
    );
  }
}