import 'package:flutter/material.dart';

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({super.key});

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  bool _radioActive = true;
  bool _mobileDeviceActive = true;
  bool _bulletproofVestActive = true;

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
        title: const Text("Mi Equipo Asignado"),
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: 4, // Number of example items
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                tileColor: const Color(0xFF2A2D32),
                leading: const Icon(Icons.radio, color: Colors.white),
                title: const Text("Radio", style: TextStyle(color: Colors.white)),
                subtitle: const Text("ID: 45A", style: TextStyle(color: Colors.grey)),
                trailing: Switch(
                  value: _radioActive,
                  onChanged: (val) {
                    setState(() {
                      _radioActive = val;
                    });
                  },
                ),
              );
            case 1:
              return ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                tileColor: const Color(0xFF2A2D32),
                leading: const Icon(Icons.flashlight_on, color: Colors.white),
                title: const Text("Linterna", style: TextStyle(color: Colors.white)),
                subtitle: const Text("ID: L-02", style: TextStyle(color: Colors.grey)),
                trailing: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                ),
              );
            case 2:
              return ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                tileColor: const Color(0xFF2A2D32),
                leading: const Icon(Icons.phone_android, color: Colors.white),
                title: const Text("Dispositivo Móvil", style: TextStyle(color: Colors.white)),
                subtitle: const Text("ID: SEG-M04", style: TextStyle(color: Colors.grey)),
                trailing: Switch(
                  value: _mobileDeviceActive,
                  onChanged: (val) {
                    setState(() {
                      _mobileDeviceActive = val;
                    });
                  },
                ),
              );
            case 3:
              return ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                tileColor: const Color(0xFF2A2D32),
                leading: const Icon(Icons.security, color: Colors.white),
                title: const Text("Chaleco Antibalas", style: TextStyle(color: Colors.white)),
                subtitle: const Text("ID: CV-11B", style: TextStyle(color: Colors.grey)),
                trailing: Switch(
                  value: _bulletproofVestActive,
                  onChanged: (val) {
                    setState(() {
                      _bulletproofVestActive = val;
                    });
                  },
                ),
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
