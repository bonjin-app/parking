import 'package:flutter/material.dart';
import 'package:parking/screens/profile/components/profile_item.dart';
import 'package:parking/widgets/design.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _buildProfile(),

          ProfileItem(
            icon: Icons.location_on,
            text: "내 동네 설정",
            onTab: (){},
          ),

          Design(
            height: 55,
            width: 55,
            color: Color(0xFFe6ebf2),
            offsetBlack: Offset(-2, -2),
            offsetWhite: Offset(2, 2),
            icon: Icons.wifi,
            blurLevel: 5.0,
            iconSize: 30,
          ),

        ],
      ),
    );
  }

  Widget _buildProfile() {
    return Container(
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
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 4,),
                  Text("용인시 수지구 동천동"),
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
