import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:weight_tracker/core/utils/constant.dart';
import 'package:weight_tracker/core/utils/media_query_values.dart';
import 'package:weight_tracker/features/weight/presentation/cubit/weight_cubit.dart';

listTileOnTap(
    BuildContext context,
    WeightCubit cubit,
    AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
    int index,
    GlobalKey<FormState> key,
    TextEditingController newWeightController) async {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: Constant.customBorder(),
    ),
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: Constant.customBorder(),
        ),
        child: Form(
          key: key,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.line_weight),
                    const VerticalDivider(color: Colors.transparent),
                    Expanded(
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: newWeightController,
                        validator: (newvalue) {
                          if (newvalue!.isEmpty) {
                            return 'Filed  required';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.numberWithOptions(
                          signed: true,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter New Weight',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minWidth: context.width / 2,
                onPressed: () async {
                  if (key.currentState!.validate()) {
                    if (double.parse(newWeightController.text) <= 200) {
                      await cubit.updateWeight(
                        snapshot.data!.docs[index].id,
                        double.parse(
                          newWeightController.text,
                        ),
                      );
                      Navigator.pop(context);
                    } else {
                      showTopSnackBar(
                        context,
                        CustomSnackBar.error(
                          message: "Value show be equal or smaller than 200",
                        ),
                      );
                    }
                  }
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
