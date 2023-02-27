import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      backgroundColor: Colors.orange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(53),
          bottomRight: Radius.circular(53),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Image.network(
                "https://kliniqa.yottat.com/doctor1.png",
                width: 80,
                height: 80,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Med Amine",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            leading: Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
            title: Text(
              "Notifications",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
            title: Text(
              "Notifications",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
            title: Text(
              "Notifications",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
            title: Text(
              "Notifications",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
            title: Text(
              "Notifications",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Container(
                width: double.infinity,
                height: 50,
                child: Center(
                    child: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w700,
                    fontSize: 21,
                  ),
                )),
              ),
              onPressed: () async {
                //  Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(
                //       builder: (BuildContext context) => LoginScreen(),
                //     ),
                //   );
              },
            ),
          ),
        ],
      ),
    );
  }
}
