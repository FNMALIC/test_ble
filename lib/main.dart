import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestPermissions();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BleScreen(),
    );
  }
}

Future<void> requestPermissions() async {
  final locationPermission = await Permission.location.request();
  if (!locationPermission.isGranted) {
    print("Location permission is required for BLE scanning");
    return;
  }
}

class BleScreen extends StatefulWidget {
  @override
  _BleScreenState createState() => _BleScreenState();
}

class _BleScreenState extends State<BleScreen> {
  final flutterReactiveBle = FlutterReactiveBle();
  final String targetMacAddress = "3C:71:BF:11:7A:32";
  final Uuid serviceUuid = Uuid.parse("4fafc201-1fb5-459e-8fcc-c5c9c331914b");
  final Uuid characteristicUuid = Uuid.parse("beb5483e-36e1-4688-b7f5-ea07361b26a8");

  List<DiscoveredDevice> devices = [];
  String connectionStatus = "Not connected";
  String readData = "No data";
  String connectedDeviceId = ""; // Track the connected device ID
  List<String> realTimeData = []; // Store real-time data received

  @override
  void initState() {
    super.initState();
    scanForDevices();
  }

  void scanForDevices() {
    setState(() {
      devices = [];
      connectionStatus = "Scanning for devices...";
    });

    flutterReactiveBle.scanForDevices(withServices: []).listen((device) {
      if (!devices.any((d) => d.id == device.id)) {
        setState(() {
          devices.add(device);
        });
      }

      if (device.id == targetMacAddress) {
        connectToDevice(device.id);
      }
    });
  }

  void connectToDevice(String deviceId) {
    setState(() {
      connectionStatus = "Connecting to device...";
    });

    flutterReactiveBle.connectToDevice(id: deviceId).listen((connectionState) {
      setState(() {
        connectionStatus =
        "Connection state: ${connectionState.connectionState}";
      });

      if (connectionState.connectionState == DeviceConnectionState.connected) {
        setState(() {
          connectedDeviceId = deviceId; // Save the connected device ID
        });
        startListeningToNotifications(deviceId);
      }
    }, onError: (error) {
      setState(() {
        connectionStatus = "Connection error: $error";
      });
    });
  }

  void startListeningToNotifications(String deviceId) {
    final characteristic = QualifiedCharacteristic(
      serviceId: serviceUuid,
      characteristicId: characteristicUuid,
      deviceId: deviceId,
    );

    flutterReactiveBle.subscribeToCharacteristic(characteristic).listen((data) {
      // Decode the data received and update the UI
      final decodedData = utf8.decode(data);
      setState(() {
        realTimeData.add(decodedData); // Add new data to the list
      });
    }, onError: (error) {
      setState(() {
        connectionStatus = "Notification error: $error";
      });
    });
  }

  void writeCharacteristic(String deviceId, List<int> value) async {
    try {
      final characteristic = QualifiedCharacteristic(
        serviceId: serviceUuid,
        characteristicId: characteristicUuid,
        deviceId: deviceId,
      );

      await flutterReactiveBle.writeCharacteristicWithResponse(characteristic, value: value);

      setState(() {
        connectionStatus = "Data written successfully!";
      });
    } catch (e) {
      setState(() {
        connectionStatus = "Error writing characteristic: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLE "),
      ),
      body: Column(
        children: [
          Text(connectionStatus),
          Text("Read Data: $readData"),
          ElevatedButton(
            onPressed: scanForDevices,
            child: Text("Rescan"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: connectedDeviceId.isEmpty
                ? null
                : () => writeCharacteristic(connectedDeviceId, [0x01, 0x02, 0x03]),
            child: Text("Send Data"),
          ),
          SizedBox(height: 20),
          Text("Real-Time Data:"),
          Expanded(
            child: ListView.builder(
              itemCount: realTimeData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(realTimeData[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
