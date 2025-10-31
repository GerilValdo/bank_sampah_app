import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

@RoutePage()
class DepositWasteScreen extends StatefulWidget {
  const DepositWasteScreen({super.key});
  static const id = '/deposit';

  @override
  State<DepositWasteScreen> createState() => _DepositWasteScreenState();
}

class _DepositWasteScreenState extends State<DepositWasteScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _weightController = TextEditingController();
  String? selectedCategory;
  double? weight;
  String? notes;
  File? imageFile;

  final picker = ImagePicker();

  @override
  void dispose() {
    // TODO: implement dispose
    _weightController.dispose();
    super.dispose();
  }

  // Daftar kategori dengan poin per kg
  final List<Map<String, dynamic>> wasteCategories = [
    {'name': 'Plastic Bottles & Containers', 'points': 50},
    {'name': 'Paper & Cardboard', 'points': 40},
    {'name': 'Metal Cans & Aluminum', 'points': 75},
    {'name': 'Glass Bottles', 'points': 60},
    {'name': 'Electronics', 'points': 100},
    {'name': 'Organic Waste', 'points': 30},
  ];

  Future<void> _pickImage() async {
    try {
      final XFile? picked = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1200,
        imageQuality: 85,
      );
      if (picked != null) {
        setState(() {
          imageFile = File(picked.path);
        });
      }
    } catch (e) {
      // handle possible errors (permission denied, etc.)
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed pick image: $e')));
    }
  }

  void _submitForm() {
    final form = _formKey.currentState;
    if (form == null) return;

    if (form.validate()) {
      form.save();

      // contoh: hitung total points jika ingin
      final selected = wasteCategories.firstWhere(
        (c) => c['name'] == selectedCategory,
        orElse: () => {},
      );
      final int ptsPerKg = selected.isNotEmpty ? selected['points'] as int : 0;
      final int totalPts = ((weight ?? 0) * ptsPerKg).round();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Deposit submitted successfully 🎉 — Earned $totalPts pts",
          ),
          backgroundColor: Colors.green,
        ),
      );

      // TODO: panggil API / simpan ke DB di sini
    } else {
      // form tidak valid
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fix errors in the form")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _buildHeader(context),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.06,
                vertical: height * 0.05,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  _buildDepositForm(),
                  const SizedBox(height: 20),
                  _buildTipsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // HEADER 
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF50C878), Colors.teal],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                const SizedBox(width: 8),

                const Text(
                  "Deposit Waste",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 4),
              child: Text(
                "Fill in the details of your waste",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // FORM
  Widget _buildDepositForm() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(top: 12),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Waste Category",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              DropdownSearch<String>(
                items: (filter, loadProps) {
                  return wasteCategories.map((e) {
                    final name = e['name'] as String;
                    final pts = e['points'] as int;
                    return "$name ($pts pts/kg)";
                  }).toList();
                },
                selectedItem: selectedCategory != null
                    ? wasteCategories.firstWhere(
                            (e) => e['name'] == selectedCategory,
                          )['name']
                          as String
                    : null,

                onChanged: (val) {
                  setState(() {
                    // Ambil hanya nama kategori tanpa "(xx pts/kg)"
                    selectedCategory = val?.split('(').first.trim();
                  });
                },

                validator: (val) => val == null || val.isEmpty
                    ? "Please select a waste category"
                    : null,

                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    hintText: "Select waste type",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.teal, width: 1.5),
                    ),
                  ),
                ),

                popupProps: PopupProps.menu(
                  fit: FlexFit.loose,
                  constraints: const BoxConstraints(maxHeight: 300),
                  showSearchBox: false,
                  menuProps: MenuProps(
                    borderRadius: BorderRadius.circular(12),
                    elevation: 4,
                    backgroundColor: Colors.white,
                  ),
                  itemBuilder: (context, item, isDisabled, isSelected) {
                    final isCurrent =
                        selectedCategory != null &&
                        item.startsWith(selectedCategory!);
                    return Container(
                      decoration: BoxDecoration(
                        color: isCurrent
                            ? Colors.teal.withValues(alpha: 0.1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.split('(').first.trim(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            item.split('(').last.replaceAll(')', ''),
                            style: const TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Weight (kg)",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),

              // Input berat
              TextFormField(
                controller: _weightController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  // hanya angka dan titik desimal
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                ],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.teal,
                      width: 1.5,
                    ),
                  ),
                  prefixIcon: const Icon(
                    FontAwesomeIcons.trashCan,
                    color: Colors.teal,
                    size: 18,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _weightController.clear();
                      // jika butuh update state/validasi live, panggil setState()
                      setState(() {});
                    },
                  ),
                  hintText: '0.0',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return "Please enter weight";
                  }
                  final parsed = double.tryParse(val);
                  if (parsed == null) return "Enter a valid number";
                  if (parsed <= 0) return "Weight must be greater than 0";
                  return null;
                },
              ),

              const SizedBox(height: 20),
              const Text(
                "Photo (Optional)",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),

              InkWell(
                onTap:
                    _pickImage, // pastikan metode ini ada dan aman (try/catch)
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.teal.withValues(alpha: 0.5),
                      style: BorderStyle.solid,
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: imageFile == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.camera_alt,
                                color: Colors.teal,
                                size: 30,
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Take or upload photo",
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              imageFile!,
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Notes (Optional)",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextFormField(
                maxLines: 3,
                onSaved: (val) => notes = val,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.teal,
                      width: 1.5,
                    ),
                  ),
                  hintText: "Add any additional information...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 25),
              Center(
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      final weightValue =
                          double.tryParse(_weightController.text) ?? 0.0;
                      // Lakukan submit / hit API / hitung points
                      // Contoh notifikasi:
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Submitted: $selectedCategory — $weightValue kg',
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please complete the form'),
                        ),
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFF00BC7D), Color(0xFF00BBA7)],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Icon(Icons.file_upload_outlined, color: Colors.white),
                        Text(
                          'Submit Deposit',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TIPS SECTION
  Widget _buildTipsSection() {
    return Card(
      color: Colors.blue[50],
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Row(
              children: [
                Icon(Icons.lightbulb_outline, color: Colors.amber),
                SizedBox(width: 8),
                Text(
                  'Tips for Better Rewards',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text("• Clean and dry your waste before depositing"),
            Text("• Separate different types of waste"),
            Text("• Take clear photos for faster approval"),
          ],
        ),
      ),
    );
  }
}
