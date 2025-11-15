import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:segcdmx_app/incident_confirmation_page/cubit/incident_confirmation_cubit.dart';
import 'package:segcdmx_app/incident_confirmation_page/view/incident_confirmation_page.dart';

class AddEvidencePage extends StatelessWidget {
  const AddEvidencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => IncidentConfirmationCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text("Adjuntar Evidencia"),
          backgroundColor: theme.scaffoldBackgroundColor,
        ),
                body: Stack(
                  children: [
                    Positioned.fill(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                // TODO(developer): Implement camera functionality
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                              ),
                              icon: const Icon(Icons.camera_alt),
                              label: const Text(
                                'ABRIR CÁMARA (Foto / Video)',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton.icon(
                              onPressed: () {
                                // TODO(developer): Implement gallery selection functionality
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                backgroundColor: const Color(0xFF2A2D32),
                              ),
                              icon: const Icon(Icons.image),
                              label: const Text(
                                'Seleccionar de Galería',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              "Puede adjuntar hasta 5 fotos o 30 segundos de video",
                              style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                            ),
                            const SizedBox(height: 16),
                            GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              children: [
                                // Example Image Card
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Stack(
                                    children: [
                                      Container(
                                        color: Colors.grey[300],
                                        child: const Center(
                                          child: Text(
                                            'IMAGEN',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Icon(Icons.cancel, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                // Example Video Card
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Stack(
                                    children: [
                                      Container(
                                        color: Colors.grey[700],
                                        child: const Center(
                                          child: Text(
                                            'VIDEO',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const Center(
                                        child: Icon(
                                          Icons.play_circle_fill,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                      ),
                                      const Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Icon(Icons.cancel, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Add some extra space at the bottom of the scrollable content
                            // to prevent the fixed button from overlapping the last grid items.
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: () {
                            print('GestureDetector tapped!'); // Debug print
                            context.read<IncidentConfirmationCubit>().showConfirmation(false);
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (context) => const IncidentConfirmationPage(),
                              ),
                            );
                          },
                          child: ElevatedButton(
                            onPressed: null, // Disable ElevatedButton's own onPressed to avoid double-tap or confusion
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text(
                              'ENVIAR REPORTE DE INCIDENTE',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),      ),
    );
  }
}
