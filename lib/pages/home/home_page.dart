import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:investment/components/amount_description.dart';
import 'package:investment/pages/home/home_bloc.dart';

import 'package:investment/utils/utils.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool>? _getData;
  HomeBloc? homeBloc;

  @override
  void initState() {
    homeBloc = HomeBloc();
    _getData = homeBloc!.getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeBloc!.logout(context);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.logout),
      ),
      backgroundColor: const Color(0xFFF8F8F8),
      body: FutureBuilder<bool>(
        future: _getData,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData && homeBloc!.appUser != null) {
            return ListView(children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Olá, ${Utils.loggedUser!.displayName!}",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        CircleAvatar(
                          radius: 22.0,
                          backgroundImage:
                              NetworkImage(Utils.loggedUser!.photoUrl!),
                          backgroundColor: Colors.transparent,
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AmountDescription(
                              amount: homeBloc!.appUser!.summarizedEquity,
                              description: "Patrimônio Total"),
                          AmountDescription(
                              amount: homeBloc!.appUser!.wallet.amount,
                              description: "Saldo em carteira"),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Minhas ações",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      height: 300,
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 1,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: [...homeBloc!.getActives()],
                      ),
                    ),
                  ],
                ),
              ),
            ]);
          } else {
            return Container(
                child: Center(
              child: CircularProgressIndicator(),
            ));
          }
        },
      ),
    );
  }
}
