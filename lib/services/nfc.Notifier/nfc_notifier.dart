import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:permission_handler/permission_handler.dart';

class NFCNotifier extends ChangeNotifier {
  bool _isProcessing = false;
  String _message = '';
  Map<String, String?> _map = {};
  bool get isProcessing => _isProcessing;
  String get message => _message;
  Map<String, String?> get map => _map;
  setLoading(bool value) {
    _isProcessing = value;
  }

  Future<void> startNFCOperation(
    NFCOperation nfcOperation, {
    String? contactName,
    String? contactEmail,
    String? contactNumber,
    String? contactUrl,
    String? contactCompany,
    String? contactJobTitle,
  }) async {
    try {
      setLoading(true);
      // Your NFC operation code here
      bool isAvail = await NfcManager.instance.isAvailable();
      if (isAvail) {
        // Your NFC operation code here

        NfcManager.instance.startSession(
          onDiscovered: (NfcTag nfcTag) async {
            // Your NFC operation code here
            if (nfcOperation == NFCOperation.read) {
              _message = 'Scanning For Contacts...';
              setLoading(true);
              readFromTag(nfcTag);
            } else if (nfcOperation == NFCOperation.write) {
              _message = 'Write To Tag...';
              setLoading(true);
              await writeToTags(
                nfcTag: nfcTag,
                contactName: contactName,
                contactEmail: contactEmail,
                contactUrl: contactUrl,
                contactNumber: contactNumber,
                contactCompany: contactCompany,
                contactJobTitle: contactJobTitle,
              );
            }
            setLoading(false);
            await NfcManager.instance.stopSession();
          },
          onError: (error) async {
            _message = error.toString();
            setLoading(false);
            notifyListeners();
          },
        );
      } else {
        _message = 'please Enable NFC From Settings';
        setLoading(false);
        notifyListeners();
      }
    } catch (e) {
      _message = e.toString();
      setLoading(false);
      notifyListeners();
    }
  }

  Future<void> readFromTag(NfcTag tag) async {
    Map<String, dynamic> nfcData = {
      'nfca': tag.data['nfca'],
      'mifareultralight': tag.data['mifareultralight'],
      'ndef': tag.data['ndef']
    };
    String? decodedText;
    if (nfcData.containsKey('ndef')) {
      List<int> payload =
          nfcData['ndef']['cachedMessage']?['records']?[0]['payload'];
      decodedText = String.fromCharCodes(payload);
      var contactInfo = parseContactInfo(decodedText);
      _map = contactInfo;
      print(decodedText);
      print({'map': _map});

      // notifyListeners();
    }
    _message = decodedText!.isEmpty ? 'No Data Found' : 'Tap to proceed';
  }

  Future<void> writeToTags({
    required NfcTag nfcTag,
    String? contactName,
    String? contactEmail,
    String? contactUrl,
    String? contactNumber,
    String? contactCompany,
    String? contactJobTitle,
  }) async {
    NdefMessage message = createNdfMessage(
        contactName: contactName,
        contactEmail: contactEmail,
        contactUrl: contactUrl,
        contactNumber: contactNumber,
        contactCompany: contactCompany,
        contactJobTitle: contactJobTitle);
    await Ndef.from(nfcTag)?.write(message);
    _message = 'DONE';
  }

  NdefMessage createNdfMessage({
    String? contactName,
    String? contactEmail,
    String? contactUrl,
    String? contactNumber,
    String? contactCompany,
    String? contactJobTitle,
  }) {
    if (contactName != null && contactName.isNotEmpty) {
      String contactData = 'BEGIN:VCARD\nVERSION:2.1\nN:$contactName\n';

      if (contactEmail != null && contactEmail.isNotEmpty) {
        contactData += 'EMAIL:$contactEmail\n';
      }

      if (contactNumber != null && contactNumber.isNotEmpty) {
        contactData += 'TEL:$contactNumber\n';
      }

      if (contactJobTitle != null && contactJobTitle.isNotEmpty) {
        contactData += 'TITLE:$contactJobTitle\n';
      }

      if (contactCompany != null && contactCompany.isNotEmpty) {
        contactData += 'ORG:$contactCompany\n';
      }

      if (contactUrl != null && contactUrl.isNotEmpty) {
        contactData += 'URL:$contactUrl\n';
      }
      contactData += 'END:VCARD';
      Uint8List contactBytes = utf8.encode(contactData);
      return NdefMessage([
        NdefRecord.createMime(
          'text/vcard',
          contactBytes,
        )
      ]);
    }
    return const NdefMessage([]);
  }

  Future<void> saveContactInfo(Map<String, String?> contactInfo) async {
    print(contactInfo);
    bool permissionGranted = await requestContactPermissions();

    if (permissionGranted) {
      final newContact =
          Contact(name: Name(first: contactInfo['name'] ?? ''), emails: [
        Email(contactInfo['email'] ?? '')
      ], phones: [
        Phone(contactInfo['phoneNumber'] ?? '')
      ], websites: [
        Website(contactInfo['url'] ?? '')
      ], organizations: [
        Organization(
            jobDescription: contactInfo['org'] ?? '',
            company: contactInfo['company'] ?? '')
      ]);

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

  Map<String, String?> parseContactInfo(String text) {
    var lines = text.split('\n');
    String? name;
    String? email;
    String? phoneNumber;
    String? url;
    String? company;
    String? org;
    for (var line in lines) {
      if (line.startsWith('N:')) {
        name = line.substring(1).trim();
        print(name);
      } else if (line.startsWith('EMAIL:')) {
        email = line.substring(6).trim();
        print(email);
      } else if (line.startsWith('TEL:')) {
        phoneNumber = line.substring(4).trim();
        print(phoneNumber);
      } else if (line.startsWith('URL:')) {
        url = line.substring(4).trim();
        print(url);
      } else if (line.startsWith('ORG:')) {
        company = line.substring(8).trim();
        print(company);
      } else if (line.startsWith('TITLE:')) {
        org = line.substring(4).trim();
        print(org);
      }
    }
    print(lines);

    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'url': url,
      'company': company,
      'org': org
    };
  }
}

enum NFCOperation { read, write }
