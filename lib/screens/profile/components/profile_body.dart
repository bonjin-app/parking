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
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 1,
                color: Colors.grey.shade200,
              ))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.assignment, size: 50,),
                      SizedBox(height: 10,),
                      Text(
                        "판매내역",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.shop, size: 50,),
                      SizedBox(height: 10,),
                      Text(
                        "구매내역",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.favorite, size: 50,),
                      SizedBox(height: 10,),
                      Text(
                        "관심목록",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ],
              ),
            ),

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
              FlatButton.icon(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: Text(
                  '프로필 보기',
                ),
                textColor: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }

}
