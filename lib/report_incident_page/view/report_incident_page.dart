import 'package:flutter/material.dart';
import 'package:segcdmx_app/add_evidence_page/view/add_evidence_page.dart';

class ReportIncidentPage extends StatelessWidget {
  const ReportIncidentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Reportar Incidente"),
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tipo de Incidente",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      hint: const Text("Seleccionar tipo"),
                      decoration: const InputDecoration().applyDefaults(theme.inputDecorationTheme),
                      items:
                          <String>[
                            'Robo',
                            'Agresión',
                            'Vandalismo',
                            'Accidente',
                            'Otro',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        // TODO(developer): Handle dropdown value change
                      },
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Descripción del Incidente",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Describa detalladamente lo sucedido...",
                      ).applyDefaults(theme.inputDecorationTheme),
                      maxLines: 5,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 24),
                    ListTile(
                      leading: Icon(Icons.gps_fixed, color: Colors.green[400]),
                      title: Text(
                        "Ubicación GPS Capturada",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        "(Precisión 5 metros)",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[400],
                        ),
                      ),
                      trailing: Icon(
                        Icons.check_circle,
                        color: Colors.green[400],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const AddEvidencePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Siguiente: Adjuntar Evidencia',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
