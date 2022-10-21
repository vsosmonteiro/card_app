import 'package:card_app_v01/bloc/cards/card_bloc.dart';
import 'package:card_app_v01/bloc/cards/card_state.dart';
import 'package:card_app_v01/widgets/card_loading_widget.dart';
import 'package:card_app_v01/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      body: _body(),
      bottomNavigationBar: _bottomAppBar(),
      floatingActionButton: _fab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Container _bottomAppBar() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xff000066),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: _bottomapprow(),
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 48.0, left: 0, right: 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0, left: 12, right: 12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.blue,
                    child: Image.asset('assets/images/avatar1.png'),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: const [
                  Text('My cards',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w500)),
                  Spacer(),
                  Text(
                    'Add +',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 1, right: 1, top: 10),
              height: 200,
              child: BlocBuilder<CardBloc, CardState>(
                bloc: BlocProvider.of<CardBloc>(context),
                builder: (context, state) {
                  if (state is ErrorCardState) {
                    return Center(
                      child: Text(state.message,
                          style: TextStyle(color: Colors.white)),
                    );
                  }
                  if (state is LoadedEmpyCardState) {
                    return Center(
                      child: Text(
                        'nao tem cartoes cadastrados',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  if (state is LoadingCardState) {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CardLoadingWidget(),
                        CardLoadingWidget(),
                        CardLoadingWidget()
                      ],
                    );
                  }
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CardWidget());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _circleIcon(const Icon(Icons.add), 'Add'),
                  _circleIcon(
                      const Icon(Icons.arrow_downward_outlined), 'Send'),
                  _circleIcon(
                      const Icon(Icons.arrow_upward_outlined), 'Receive'),
                  _circleIcon(const Icon(Icons.menu), 'Menu')
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF222222),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(6)),
                      margin: const EdgeInsets.only(top: 20),
                      height: 6,
                      width: 40,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12, top: 12, right: 24),
                    child: Row(
                      children: const [
                        Text(
                          'Last Transactions',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2),
                        ),
                        Spacer(),
                        Text(
                          'View All',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  _purchasesContainer(),
                  _purchasesContainer(),
                  _purchasesContainer(),
                  SizedBox(
                    height: 120,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _purchasesContainer() {
    return Container(
      margin: EdgeInsets.only(left: 12, top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 28,
            child: Image.asset('assets/images/amazon.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Amazon',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              Text('22  February  2022',
                  style: TextStyle(color: Colors.white70, fontSize: 16))
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Text(
              ' - \$28.00',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  Column _circleIcon(Icon icon, String text) {
    return Column(
      children: [
        CircleAvatar(radius: 24, backgroundColor: Colors.white, child: icon),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, letterSpacing: 2),
          ),
        )
      ],
    );
  }

  Row _bottomapprow() {
    return Row(
      children: [
        _bottomappchild(
          const Icon(
            Icons.home_outlined,
            color: Colors.white,
            size: 32,
          ),
        ),
        _bottomappchild(
          const Icon(
            Icons.account_balance_outlined,
            color: Colors.white,
            size: 32,
          ),
        ),
        const Spacer(),
        _bottomappchild(
          const Icon(
            Icons.credit_card_outlined,
            color: Colors.white,
            size: 32,
          ),
        ),
        _bottomappchild(
          const Icon(
            Icons.settings,
            color: Colors.white,
            size: 32,
          ),
        )
      ],
    );
  }

  SizedBox _fab() {
    return SizedBox(
      height: 80,
      width: 80,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff9BE1F2),
        child: const Icon(
          Icons.account_balance_wallet,
          color: Colors.black,
          size: 32,
        ),
      ),
    );
  }

  Container _bottomappchild(Icon icon) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: icon);
  }
}
