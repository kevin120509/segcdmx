import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:segcdmx_app/duty_page/cubit/duty_cubit.dart';
import 'package:segcdmx_app/report_incident_page/view/report_incident_page.dart';

class DutyPage extends StatelessWidget {
  const DutyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: BlocBuilder<DutyCubit, DutyState>(
        builder: (context, state) {
          if (state is DutyOffDuty) {
            return Column(
              children: [
                // Encabezado
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.security_outlined,
                        color: theme.colorScheme.primary,
                        size: 30,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Bienvenido, Carlos',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Contenido Principal
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            // Image placeholder for the map
                            Image.network(
                              'https://via.placeholder.com/400x200?text=Mapa+de+Zona',
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            // Dark semi-transparent container for text
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(15),
                                ),
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mi Próximo Turno',
                                    style: theme.textTheme.headlineSmall
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Horario: 8:00-16:00',
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                          color: Colors.white70,
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Zona Asignada: Sector A-01',
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                          color: Colors.white70,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Botón Fijo (Sticky)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<DutyCubit>().checkIn();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'HACER CHECK-IN',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is DutyOnDuty) {
            return Column(
              children: [
                AppBar(
                  title: const Text('GuardPro'),
                  leading: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      // TODO(developer): Implement menu logic
                    },
                  ),
                  backgroundColor: theme.scaffoldBackgroundColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    color: Colors.green[700], // Dark green for active turn
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'TURNO ACTIVO',
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow:
                                  TextOverflow.ellipsis, // Handle overflow
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.gps_fixed, color: Colors.white),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              'Seguimiento GPS activo',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.white,
                              ),
                              overflow:
                                  TextOverflow.ellipsis, // Handle overflow
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Map Section
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.network(
                        'https://picsum.photos/600/400?random=1', // Changed to a more reliable placeholder
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const ReportIncidentPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[700], // Red for incident
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text(
                          'REPORTAR INCIDENTE',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<DutyCubit>().checkOut();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                            0xFF2A2D32,
                          ), // Dark grey for check-out
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text(
                          'HACER CHECK-OUT',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
