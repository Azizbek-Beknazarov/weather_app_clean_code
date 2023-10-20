import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ob_havo_app/features/presentation/bloc/obhavo_bloc.dart';

class HourlyObHavo extends StatelessWidget {
  const HourlyObHavo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObHavoBloc, ObHavoState>(
      builder: (ctx, state) {
        if (state is LoadedObHavo) {
          return Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(width: 0.9, color: Colors.red),
                      borderRadius: BorderRadius.circular(35)),
                  child: Text('Bulutlilik: ${state.obhavo.cloudiness} %'),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.2,
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(35)),
                        child: Text(
                            'Uzunlik: ${state.obhavo.coord.lon.toString()}'),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.2,
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(35)),
                        child: Text(
                            'Kenglik: ${state.obhavo.coord.lat.toString()}'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 9,
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(width: 1.2, color: Colors.red),
                            borderRadius: BorderRadius.circular(35)),
                        child: Text(
                            'Kun chiqishi: ${DateFormat.Hm().format(state.obhavo.sys.sunrise)}'),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            border: Border.all(width: 1.2, color: Colors.green),
                            borderRadius: BorderRadius.circular(35)),
                        child: Text(
                            'Kun botishi: ${DateFormat.Hm().format(state.obhavo.sys.sunset)}'),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.2, color: Colors.white),
                      borderRadius: BorderRadius.circular(35)),
                  child: Text(
                    'Vaqt mintaqasi: GMT ${((state.obhavo.timezone).round())}',
                    style: const TextStyle(color: Colors.yellow),
                  ),
                )
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
