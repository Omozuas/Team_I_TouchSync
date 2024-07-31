import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:touchsync/services/database/providers/contactProvider.dart';
import 'package:touchsync/views/history_screen/subWidget/historiesList%20.dart';
import 'package:touchsync/widgets/textWidget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<Contactprovider>(context, listen: false).fetchProfiles();
  }

  void _onSearchChanged() {
    Provider.of<Contactprovider>(context, listen: false)
        .fetchProfiles(filter: _searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final get = context.watch<Contactprovider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(16),
            buildTextField('Search history', const Color(0xffFFFFFF),
                prefixIcon: Icons.search_outlined,
                controller: _searchController, onChange: (value) {
              _onSearchChanged();
            }),
            const Gap(16),
            Text('Saved History',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 18)),
            Gap(16),
            get.profiles.isEmpty
                ? Center(child: Text('No contacts available'))
                : HistoriesList(
                    get: get.profiles,
                  ),
          ],
        ),
      ),
    );
  }
}
