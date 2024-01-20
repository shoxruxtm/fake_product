import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeLoadingData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            print("HomeSuccess");
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: state.productList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: GridTile(
                    footer: GridTileBar(
                      title: Text(state.productList[index].title!),
                      backgroundColor: Colors.black45,
                    ),header: GridTileBar(
                      title: Text(state.productList[index].price!.toString()),
                      backgroundColor: Colors.black45,
                    ),
                    child: Image.network(state.productList[index].image!),
                  ),
                );
              },
            );
          }
          if (state is HomeError) {
            print("HomeError");
            return const Center(
              child: Text(
                "Error",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            );
          }
          print("HomeLoading");
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return const Card();
            },
          );
        },
      ),
    );
  }
}
