import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
   DrawerWidget({required this.onClick,super.key});
Function onClick;
   static const int category_id=1;
   static const int settings_id=2;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * .7,
      child: Column(
        children: [
          Container(
            height: 120,
            color: Colors.green,
            alignment: Alignment.center,
            child: Text(
              "News App",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          GestureDetector(
            onTap:  () {
              onClick(category_id);
            },
            child: Row(
              children: [
                const SizedBox(width: 5),
                const Icon(Icons.list_rounded,color: Colors.black,size: 35,),
                const SizedBox(width: 10),
                Text("Categories",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 25),)
              ],
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              onClick(settings_id);
            },
            child: Row(
              children: [
                const SizedBox(width: 5),
                const Icon(Icons.settings,color: Colors.black,size: 35,),
                const SizedBox(width: 10),
                Text("Settings",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 25),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
