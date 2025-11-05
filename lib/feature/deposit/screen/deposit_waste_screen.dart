import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/utils/icon_mapper.dart';
import 'package:bank_sampah_app/feature/deposit/bloc/category_bloc.dart';
import 'package:bank_sampah_app/feature/deposit/database/category_local_data_source.dart';
import 'package:bank_sampah_app/feature/deposit/database/deposit_local_data_source.dart';
import 'package:bank_sampah_app/feature/deposit/models/category_model.dart';
import 'package:bank_sampah_app/feature/deposit/models/deposit_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

@RoutePage()
class DepositWasteScreen extends StatefulWidget {
  const DepositWasteScreen({super.key, this.deposit});
  static const id = '/deposit';
  final DepositModel? deposit;

  @override
  State<DepositWasteScreen> createState() => _DepositWasteScreenState();
}

class _DepositWasteScreenState extends State<DepositWasteScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  String? selectedCategory;
  double? weight;
  File? imageFile;

  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(CategoryEvent.loadCategories());
    if (widget.deposit != null) {
      final d = widget.deposit!;
      _weightController.text = d.weight.toString();
      selectedCategory = d.nameCategory;
      _notesController.text = d.notes.toString();
      if (d.imageUrl != null && d.imageUrl!.isNotEmpty) {
        imageFile = File(d.imageUrl!);
      }
    }
  }

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

  Future<void> _submitForm() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please complete the form')));
      return;
    }

    _formKey.currentState?.save();
    final weightValue = double.tryParse(_weightController.text) ?? 0.0;

    final categorySource = CategoryLocalDataSource();
    final depositSource = DepositLocalDataSource();

    // Ambil kategori dari database
    final categories = await categorySource.getAllCategories();
    final selected = categories.firstWhere(
      (c) => c.name == selectedCategory,
      orElse: () => CategoryModel(
        id: 1,
        name: 'Unknown',
        iconName: 'question',
        pointsPerKg: 0,
      ),
    );

    final totalPoints = (weightValue * selected.pointsPerKg).round();

    // Buat model Deposit
    final deposit = DepositModel(
      id: widget.deposit?.id, 
      categoryId: selected.id ?? 1,
      weight: weightValue,
      totalPoints: totalPoints,
      status: widget.deposit?.status ?? 'pending',
      imageUrl: imageFile?.path,
      notes: _notesController.text,
      createdAt: widget.deposit?.createdAt ?? DateTime.now(),
      nameCategory: selected.name,
      iconNameCategory: selected.iconName,
    );

    // Tentukan mode Create / Update
    if (widget.deposit == null) {
      await depositSource.insertDeposit(deposit);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Deposit Added: ${selected.name} — $weightValue kg'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      await depositSource.updateDeposit(deposit);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Deposit Updated: ${selected.name} — $weightValue kg'),
          backgroundColor: Colors.blue,
        ),
      );
    }

    // Reset form & kembali ke halaman sebelumnya
    _formKey.currentState?.reset();
    _weightController.clear();
    _notesController.clear();
    setState(() {
      selectedCategory = null;
      imageFile = null;
    });

    Navigator.pop(context, true); // untuk trigger refresh setelah kembali
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _notesController.dispose();
    _weightController.dispose();
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
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.categories.isEmpty) {
                    return const Text("No categories available");
                  }

                  final data = state.categories;

                  return DropdownSearch<String>(
                    items: (filter, props) => data
                        .map((c) => "${c.name} (${c.pointsPerKg} pts/kg)")
                        .toList(),
                    selectedItem: selectedCategory,
                    onChanged: (val) {
                      setState(() {
                        selectedCategory = val?.split('(').first.trim();
                      });
                    },
                    validator: (val) => val == null || val.isEmpty
                        ? "Please select a category"
                        : null,
                    dropdownBuilder: (context, selectedItem) {
                      if (selectedItem == null) return const SizedBox();

                      final category = data.firstWhere(
                        (c) => selectedItem.startsWith(c.name),
                        orElse: () => data.first,
                      );

                      return Row(
                        children: [
                          Icon(
                            mapIconName(category.iconName),
                            color: Colors.teal,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "${category.name} (${category.pointsPerKg} pts/kg)",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      );
                    },
                    popupProps: PopupProps.menu(
                      constraints: const BoxConstraints(maxHeight: 300),
                      showSearchBox: false,
                      itemBuilder: (context, item, isDisabled, isSelected) {
                        final category = data.firstWhere(
                          (c) => item.startsWith(c.name),
                          orElse: () => data.first,
                        );
                        return ListTile(
                          leading: Icon(
                            mapIconName(category.iconName),
                            color: Colors.teal,
                          ),
                          title: Text(category.name),
                          subtitle: Text("${category.pointsPerKg} pts/kg"),
                        );
                      },
                    ),
                    decoratorProps: DropDownDecoratorProps(
                      decoration: InputDecoration(
                        hintText: "Select waste type",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  );
                },
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
                onTap: _pickImage,
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
                controller: _notesController,
                maxLines: 3,
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
                    _submitForm();
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
                          widget.deposit == null
                              ? 'Submit Deposit'
                              : 'Update Deposit',
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
