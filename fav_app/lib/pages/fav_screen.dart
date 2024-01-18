import 'package:fav_app/blocs/bloc/fav_screen_bloc.dart';
import 'package:fav_app/model/fav_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavScreen extends StatefulWidget {
  const MyFavScreen({super.key});

  @override
  State<MyFavScreen> createState() => _MyFavScreenState();
}

class _MyFavScreenState extends State<MyFavScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavScreenBloc>().add(FetchFavList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyFavScreen'),
        centerTitle: true,
        actions: [
          BlocBuilder<FavScreenBloc, FavScreenState>(
            builder: (context, state) {
              return Visibility(
                visible: state.temFavouriteList.isNotEmpty ? true : false,
                child: IconButton(
                    onPressed: () {
                      context.read<FavScreenBloc>().add(DeleteItem());
                    },
                    icon: Icon(Icons.remove)),
              );
            },
          )
        ],
      ),
      body:
          BlocBuilder<FavScreenBloc, FavScreenState>(builder: (context, state) {
        switch (state.listStatus) {
          case ListStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case ListStatus.failure:
            return const Text("Something went wrong");
          case ListStatus.success:
            return ListView.builder(
              itemCount: state.favouriteList.length,
              itemBuilder: (context, index) {
                final item = state.favouriteList[index];
                return Card(
                  child: ListTile(
                    leading: Checkbox(
                        value: state.temFavouriteList.contains(item)
                            ? true
                            : false,
                        onChanged: (value) {
                          if (value!) {
                            context
                                .read<FavScreenBloc>()
                                .add(SelectItem(item: item));
                          } else {
                            context
                                .read<FavScreenBloc>()
                                .add(UnSelectItem(item: item));
                          }
                        }),
                    title: Text(item.value.toString()),
                    trailing: IconButton(
                      onPressed: () {
                        FavourtieListModel favourtieListModel =
                            FavourtieListModel(
                                id: item.id,
                                value: item.value,
                                isFavourite: item.isFavourite ? false : true,
                                isDeleting: item.isDeleting ? false : true);
                        context
                            .read<FavScreenBloc>()
                            .add(FavItemClick(item: favourtieListModel));
                      },
                      icon: Icon(
                        item.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            );
        }
      }),
    );
  }
}
