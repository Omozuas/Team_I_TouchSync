import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:permission_handler/permission_handler.dart';

class NFCNotifier extends ChangeNotifier {
  bool _isProcessing = false;
  String _message = '';
  bool get isProcessing => _isProcessing;
  String get message => _message;
  setLoading(bool value) {
    _isProcessing = value;
    notifyListeners();
  }

  Future<void> startNFCOperation(
    NFCOperation nfcOperation,
    String? contactName,
    String? contactEmail,
    String? contactNumber,
    String? contactUrl,
  ) async {
    try {
      setLoading(true);
      // Your NFC operation code here
      bool isAvail = await NfcManager.instance.isAvailable();
      if (isAvail) {
        // Your NFC operation code here
        // For example, you can read a tag like this
        if (nfcOperation == NFCOperation.read) {
          _message = 'Scanning...';
        } else if (nfcOperation == NFCOperation.write) {
          _message = 'Writting To Tag...';
        }
        notifyListeners();
        NfcManager.instance.startSession(
          onDiscovered: (NfcTag nfcTag) async {
            // Your NFC operation code here
            if (nfcOperation == NFCOperation.read) {
              _readFromTag(nfcTag);
            } else if (nfcOperation == NFCOperation.write) {
              await _writeToTags(
                nfcTag: nfcTag,
                contactName: contactName,
                contactEmail: contactEmail,
                contactUrl: contactUrl,
                contactNumber: contactNumber,
              );
            }
            setLoading(false);
            await NfcManager.instance.stopSession();
          },
          onError: (error) async {
            _message = error.message;
            setLoading(false);
          },
        );
      } else {
        _message = 'please Enable NFC From Settings';
        setLoading(false);
      }
    } catch (e) {
      _message = e.toString();
      setLoading(false);
    }
  }

  Future<void> _readFromTag(NfcTag tag) async {
    Map<String, dynamic> nfcData = {
      'nfca': tag.data['nfca'],
      'mifareultralight': tag.data['mifareultralight'],
      'ndef': tag.data['ndef']
    };
    String? decodedText;
    if (nfcData.containsKey('ndef')) {
      List<int> payload =
          nfcData['ndef']['cashedMessage']?['records']?[0]['payload'];
      decodedText = String.fromCharCodes(payload);

      // Parse contact information from the decoded text
      var contactInfo = _parseContactInfo(decodedText);

      // Save the parsed contact information to the phone's contacts
      await _saveContactInfo(contactInfo);
    }
    _message = decodedText ?? 'No Data Found';
  }

  Future<void> _writeToTags({
    required NfcTag nfcTag,
    String? contactName,
    String? contactEmail,
    String? contactUrl,
    String? contactNumber,
  }) async {
    NdefMessage message = _createNdfMessage(
      contactName: contactName,
      contactEmail: contactEmail,
      contactUrl: contactUrl,
      contactNumber: contactNumber,
    );
    await Ndef.from(nfcTag)?.write(message);
    _message = 'DONE';
  }

  NdefMessage _createNdfMessage({
    String? contactName,
    String? contactEmail,
    String? contactUrl,
    String? contactNumber,
  }) {
    List<NdefRecord> records = [];
    if (contactUrl != null && contactUrl.isNotEmpty) {
      records.add(NdefRecord.createUri(Uri.parse(contactUrl)));
    }
    if (contactEmail != null && contactEmail.isNotEmpty) {
      records.add(NdefRecord.createUri(Uri.parse("mailto:$contactEmail")));
    }
    if (contactName != null && contactName.isNotEmpty) {
      String contactData = 'BEGIN:VCARD\nVERSION:2.1\nN:$contactName\n';
      if (contactEmail != null && contactEmail.isNotEmpty) {
        contactData += 'EMAIL:$contactEmail\n';
      }
      if (contactNumber != null && contactNumber.isNotEmpty) {
        contactData += 'TEL:$contactNumber\n';
      }
      contactData += 'END:VCARD';
      Uint8List contactBytes = utf8.encode(contactData);
      records.add(NdefRecord.createMime('text/vcard', contactBytes));
    }
    return NdefMessage(records);
  }

  Future<void> _saveContactInfo(Map<String, String?> contactInfo) async {
    bool permissionGranted = await requestContactPermissions();

    if (permissionGranted) {
      final newContact = Contact(
        name: Name(first: contactInfo['name'] ?? ''),
        emails: [Email(contactInfo['email'] ?? '')],
        phones: [Phone(contactInfo['phoneNumber'] ?? '')],
        websites: [Website(contactInfo['url'] ?? '')],
      );

      await FlutterContacts.insertContact(newContact);
    } else {
      // Handle the case where permission is not granted
      print("Permission to access contacts is denied.");
    }
  }

  Future<bool> requestContactPermissions() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied || status.isPermanentlyDenied) {
      return await Permission.contacts.request().isGranted;
    } else {
      return false;
    }
  }

  Map<String, String?> _parseContactInfo(String text) {
    var lines = text.split('\n');
    String? name;
    String? email;
    String? phoneNumber;
    String? url;
    for (var line in lines) {
      if (line.startsWith('FN:')) {
        name = line.substring(3);
      } else if (line.startsWith('EMAIL:')) {
        email = line.substring(6);
      } else if (line.startsWith('TEL:')) {
        phoneNumber = line.substring(4);
      } else if (line.startsWith('URL:')) {
        url = line.substring(4);
      }
    }
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'url': url,
    };
  }
}

enum NFCOperation { read, write }