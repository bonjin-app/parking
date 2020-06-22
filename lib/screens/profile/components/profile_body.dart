import 'package:flutter/material.dart';
import 'package:parking/screens/profile/components/profile_item.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Column(
          children: <Widget>[
            _buildProfile(),

            ProfileItem(
              icon: Icons.location_on,
              text: "내 동네 설정",
              onTab: (){},
            ),
            ProfileItem(
              icon: Icons.label_outline,
              text: "키워드 알림",
              onTab: (){},
            ),

            Divider(
              thickness: 8,
              color: Colors.grey[100],
            ),

            ProfileItem(
              icon: Icons.mail,
              text: "친구초대",
              onTab: (){},
            ),
            ProfileItem(
              icon: Icons.share,
              text: "주차앱 공유",
              onTab: (){},
            ),
            ProfileItem(
              icon: Icons.notifications_none,
              text: "공지사항",
              onTab: (){},
            ),
            ProfileItem(
              icon: Icons.headset_mic,
              text: "자주 묻는 질문",
              onTab: (){},
            ),
            ProfileItem(
              icon: Icons.settings,
              text: "앱 설정",
              onTab: (){},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.grey.shade200,
              )
          )
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://image.esquirekorea.co.kr/wp-content/uploads/2019/02/190228-114-08.jpg",
                  ),
                  maxRadius: 30,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("GIGAS", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 4,),
                  Text("용인시 수지구 동천동", style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text("프로필 보기"),
              )
            ],
          )
        ],
      ),
    );
  }

}
