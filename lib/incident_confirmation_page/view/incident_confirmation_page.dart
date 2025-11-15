import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:segcdmx_app/incident_confirmation_page/cubit/incident_confirmation_cubit.dart';

class IncidentConfirmationPage extends StatelessWidget {
  const IncidentConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<IncidentConfirmationCubit, IncidentConfirmationState>(
                builder: (context, state) {
                  if (state is ConfirmationSuccess) {
                    return Column(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 80),
                        SizedBox(height: 24),
                        Text(
                          "Incidente Reportado",
                          style: theme.textTheme.headlineSmall,
                        ),
                        Text(
                          "El incidente [ID-123] ha sido enviado correctamente.",
                          style: theme.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  } else if (state is ConfirmationOffline) {
                    return Column(
                      children: [
                        Icon(Icons.cloud_off, color: Colors.orange, size: 80),
                        SizedBox(height: 24),
                        Text(
                          "Incidente Guardado (Sin Conexión)",
                          style: theme.textTheme.headlineSmall,
                        ),
                        Text(
                          "No hay conexión a internet. El incidente se ha guardado localmente y se enviará automáticamente cuando se reconecte.",
                          style: theme.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink(); // Initial state or other states
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text(
            'Volver al Inicio',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
