import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/core/utils/app_strings.dart';
import 'package:weight_tracker/features/login/presentation/cubit/login_cubit.dart';
import 'package:weight_tracker/features/login/presentation/widgets/loading_widget.dart';
import 'package:weight_tracker/features/weight/presentation/cubit/weight_cubit.dart';
import 'package:weight_tracker/features/weight/presentation/screens/empty_widget.dart';
import 'package:weight_tracker/features/weight/presentation/widgets/list_tile_on_tap.dart';
import 'package:weight_tracker/features/weight/presentation/widgets/weight_entry_widget.dart';

class WeightScreen extends StatelessWidget {
  const WeightScreen() : super();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<WeightCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          IconButton(
            onPressed: () async {
              await context.read<LoginCubit>().logOut(context);
            },
            icon: Icon(Icons.exit_to_app_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          WeightEntryWidget(cubit: cubit),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(AppStrings.collectionName)
                .orderBy('date', descending: true)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LoadingWidget(),
                );
              } else if (snapshot.hasData) {
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {},
                    child: snapshot.data!.size == 0
                        ? EmptyWidget()
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => ListTile(
                              onTap: () async {
                                //! To Assign selected item data
                                cubit.newWeightController.text = snapshot
                                    .data!.docs[index]['weight']
                                    .toString();
                                await listTileOnTap(
                                  context,
                                  cubit,
                                  snapshot,
                                  index,
                                  cubit.key,
                                  cubit.newWeightController,
                                );
                              },
                              title: Text(snapshot.data!.docs[index]['weight']
                                  .toString()),
                              subtitle: Text(
                                '${(snapshot.data!.docs[index]['date'] as Timestamp).toDate().year} / ${(snapshot.data!.docs[index]['date'] as Timestamp).toDate().month} / ${(snapshot.data!.docs[index]['date'] as Timestamp).toDate().day} - ${(snapshot.data!.docs[index]['date'] as Timestamp).toDate().hour} : ${(snapshot.data!.docs[index]['date'] as Timestamp).toDate().minute}',
                              ),
                              leading: const Icon(Icons.line_weight),
                              trailing: IconButton(
                                onPressed: () {
                                  cubit.deleteWeight(
                                      snapshot.data!.docs[index].id);
                                },
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.red.withOpacity(.7),
                                ),
                              ),
                            ),
                            itemCount: snapshot.data!.docs.length,
                          ),
                  ),
                );
              } else {
                return Center(
                  child: Text('Error'),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
