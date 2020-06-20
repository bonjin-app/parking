import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parking/models/contact.dart';
import 'package:parking/providers/user_provider.dart';
import 'package:parking/repository/message_repository.dart';
import 'package:parking/screens/chat/components/chat_empty.dart';
import 'package:parking/screens/chat/components/chat_item.dart';
import 'package:parking/widgets/custom_input_search.dart';
import 'package:provider/provider.dart';

class ChatBody extends StatelessWidget {
  final _messageRepository = MessageRepository();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomInputSearch(),

          StreamBuilder<QuerySnapshot>(
              stream: _messageRepository.fetchContacts(userId: userProvider.user.uid),
              builder: (context, snapshot) {

                if (snapshot.hasData) {
                  var docList = snapshot.data.documents;

                  if(docList.isEmpty) {
                    return ChatEmpty();
                  }

                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: docList.length,
                    itemBuilder: (context, index) {

                      Contact contact = Contact.fromMap(docList[index].data);
                      return ChatItem(contact: contact,);
                    },
                  );
                }

                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
          ),
        ],
      ),
    );
  }
}
