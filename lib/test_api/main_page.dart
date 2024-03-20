
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MainPage extends StatefulWidget {
  final int index;

  const MainPage(this.index, {super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String data = '';
  //List<String> data=[];
  //String firstGameFetchPic='';

  Future<void> fetchData() async {
    //debugPrint('test1');
    try{
      //debugPrint('test2');
      final response = await http.get(Uri.parse('https://store.steampowered.com/api/appdetails?appids=1245620'));
      //final response = await http.get(Uri.parse('https://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=42E0F0ECB77FDE7649DB8817C30B2F0E&steamid=76561198161162167&include_appinfo=true&format=json'));

      if (response.statusCode == 200) {
        //debugPrint('test3');
        //debugPrint(json.decode(response.body)['response']['game_count']);
        //debugPrint('test4');
        setState(() {
          data = json.decode(response.body)['1245620']['data']['background_raw'];
          //var nbrOfGames=json.decode(response.body)['response']['game_count'];
          //for(int i=0;i<nbrOfGames;i++) {
          //  data.add(json.decode(response.body)['response']['games']['name']);
          //}
          //String url='http://media.steampowered.com/steamcommunity/public/images/apps/';//{appid}/{hash}';
          //String ulr=url + json.decode(response.body)['response']['games']['appid'];
          //firstGameFetchPic=json.decode(response.body)['response']['games']['img_icon_url']+'.jpg';

        });

      } else {
        debugPrint('failed');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        data = 'Error : $e';//['Error: $e'];
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
      
        decoration: const BoxDecoration(
          color: Color(0xff0B0B0B),
        ),
      
        child: Column(
          children: [
            ////
            //// <============ PUT YOUR STUFF IN THE CHILDREN OF THE ROW BELOW GUYS
            ////

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  widget.index.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 560
                  ),
                ),
                ElevatedButton(
                  onPressed: fetchData,
                  child: const Text('Fetch Data'),
                ),

                const SizedBox(height: 20),
                Image.network(data)//firstGameFetchPic

                /*
                Text(data,
                  style: const TextStyle(
                    color:Colors.white,
                    fontSize:11
                  ),
                ),

                 */

                 //Image.network('https://community.cloudflare.steamstatic.com/public/images/signinthroughsteam/sits_02.png'),
                  //https://store.steampowered.com/api/appdetails?appids=400

              ],
            ),

            ////
            //// xxxxxxxxxxxxx STOP YOU ARE GOING TOO FAR
            ////
          ],
        ),
      ),
    );
  }
}


class Header extends StatelessWidget {

  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 150,

      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Images/Liquid-Bg-Green.jpg'),
          fit: BoxFit.cover,
        ),
      ),

      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 40),
            height: 60,
            width: 60,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.black
            ),

            child: IconButton(
              icon: const Icon(Icons.bookmarks_rounded,color: Colors.white),
              iconSize: 30,
              onPressed: () {
              }
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 40),
            height: 60,
            width: 250,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.black
            ),
            child: const Center(
              child: Text(
                "SteamDB 2.0",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
