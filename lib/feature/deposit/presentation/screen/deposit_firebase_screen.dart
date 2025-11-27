import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/utils/icon_mapper.dart';

// Firebase & Blocs
import 'package:bank_sampah_app/feature/deposit/models/category_firebase_model.dart';
import 'package:bank_sampah_app/feature/deposit/models/deposit_firebase_model.dart';
import 'package:bank_sampah_app/feature/deposit/presentation/bloc/category_firebase_bloc.dart';
import 'package:bank_sampah_app/feature/deposit/presentation/bloc/deposit_firebase_bloc.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

@RoutePage()
class DepositFirebaseScreen extends StatefulWidget {
  const DepositFirebaseScreen({super.key, this.deposit});
  static const id = '/deposit-firebase';
  final DepositFirebaseModel? deposit;

  @override
  State<DepositFirebaseScreen> createState() => _DepositFirebaseScreenState();
}

class _DepositFirebaseScreenState extends State<DepositFirebaseScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  String? selectedCategory;
  String? selectedStatus;

  File? imageFile;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (widget.deposit == null) {
      selectedCategory = null; // dipaksa pilih manual
    }

    if (widget.deposit != null) {
      final d = widget.deposit!;

      _weightController.text = d.weight.toString();
      _notesController.text = d.notes ?? "";
      selectedCategory = d.nameCategory;
      selectedStatus = d.status;

      if (d.imageUrl != null && d.imageUrl!.isNotEmpty) {
        imageFile = File(d.imageUrl!);
      }
    } else {
      selectedStatus = "pending";
    }
  }

  final Map<String, Color> statusColors = {
    "pending": Colors.orange,
    "completed": Colors.green,
    "rejected": Colors.red,
  };

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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed pick image: $e")));
    }
  }

  Future<void> _submitForm() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please complete the form")));
      return;
    }

    _formKey.currentState?.save();

    final weightValue = double.tryParse(_weightController.text) ?? 0.0;

    final catState = context.read<CategoryFirebaseBloc>().state;

    final firebaseCategories = catState.maybeWhen(
      loaded: (cats) => cats,
      orElse: () => <CategoryFirebaseModel>[],
    );

    final categories = firebaseCategories;
    final selectedCat = categories.firstWhere(
      (c) => c.name == selectedCategory,
      orElse: () => categories.first,
    );

    final totalPoints = (weightValue * selectedCat.pointsPerKg).round();
    final userId = FirebaseAuth.instance.currentUser?.uid;

    final depositFirebase = DepositFirebaseModel(
      id: widget.deposit?.id, // FIX ID
      userId: userId,
      categoryId: selectedCat.id.toString(),
      weight: weightValue,
      totalPoints: totalPoints,
      status: selectedStatus ?? "pending",
      imageUrl: imageFile?.path,
      notes: _notesController.text,
      createdAt: widget.deposit?.createdAt ?? DateTime.now(),
      nameCategory: selectedCat.name,
      iconNameCategory: selectedCat.iconName,
      pointsPerKgCategory: selectedCat.pointsPerKg,
    );

    final bloc = context.read<DepositFirebaseBloc>();

    if (widget.deposit == null) {
      bloc.add(DepositFirebaseEvent.addDeposit(depositFirebase));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Submitting deposit: ${selectedCat.name} — $weightValue kg",
          ),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      bloc.add(DepositFirebaseEvent.updateDeposit(depositFirebase));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Updating deposit: ${selectedCat.name} — $weightValue kg",
          ),
          backgroundColor: Colors.blue,
        ),
      );
    }

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      body: BlocListener<DepositFirebaseBloc, DepositFirebaseState>(
        listener: (context, state) {
          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Error: ${state.errorMessage}"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: SingleChildScrollView(
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
      ),
    );
  }

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

              BlocBuilder<CategoryFirebaseBloc, CategoryFirebaseState>(
                builder: (context, state) {
                  final isLoading = state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  );

                  final cats = state.maybeWhen(
                    loaded: (cats) => cats,
                    orElse: () => <CategoryFirebaseModel>[],
                  );

                  if (isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (cats.isEmpty) {
                    return const Text("No categories available");
                  }

                  return DropdownSearch<CategoryFirebaseModel>(
                    items: (filter, props) => cats,
                    selectedItem: cats.firstWhere(
                      (c) => c.name == selectedCategory,
                      orElse: () => cats.first,
                    ),
                    compareFn: (a, b) => a.idCategory == b.idCategory,
                    itemAsString: (cat) =>
                        "${cat.name} (${cat.pointsPerKg} pts/kg)",

                    onChanged: (cat) => setState(() {
                      selectedCategory = cat?.name;
                    }),

                    validator: (v) =>
                        v == null ? "Please select a category" : null,

                    dropdownBuilder: (context, cat) {
                      if (cat == null) return const SizedBox();
                      return Row(
                        children: [
                          Icon(
                            mapIconName(cat.iconName),
                            color: Colors.teal,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "${cat.name} (${cat.pointsPerKg} pts/kg)",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      );
                    },

                    popupProps: PopupProps.menu(
                      showSearchBox: false,
                      itemBuilder: (context, cat, _, __) => ListTile(
                        leading: Icon(
                          mapIconName(cat.iconName),
                          color: Colors.teal,
                        ),
                        title: Text(cat.name),
                        subtitle: Text("${cat.pointsPerKg} pts/kg"),
                      ),
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

              TextFormField(
                controller: _weightController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                ],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    FontAwesomeIcons.trashCan,
                    color: Colors.teal,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _weightController.clear();
                      setState(() {});
                    },
                  ),
                  hintText: "0.0",
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
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return "Please enter weight";
                  final w = double.tryParse(v);
                  if (w == null) return "Enter a valid number";
                  if (w <= 0) return "Weight must be > 0";
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
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.teal.withOpacity(0.5),
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
                                style: TextStyle(color: Colors.teal),
                              ),
                            ],
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(imageFile!, fit: BoxFit.cover),
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
                  hintText: "Add notes...",
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
                ),
              ),

              // -------------------------------------------------
              // 🔥 MODERN STATUS DROPDOWN (Tambah DISINI)
              // -------------------------------------------------
              const SizedBox(height: 20),
              const Text(
                "Deposit Status",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),

              DropdownSearch<String>(
                items: (filter, props) => ["pending", "completed", "rejected"],

                selectedItem: selectedStatus,
                compareFn: (a, b) => a == b,

                dropdownBuilder: (context, status) {
                  if (status == null) return const SizedBox();
                  final color = statusColors[status]!;
                  return Row(
                    children: [
                      Icon(Icons.circle, color: color, size: 14),
                      const SizedBox(width: 8),
                      Text(
                        status[0].toUpperCase() + status.substring(1),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: color,
                        ),
                      ),
                    ],
                  );
                },

                popupProps: PopupProps.menu(
                  showSearchBox: false,
                  itemBuilder: (context, status, isDisabled, isSelected) {
                    return ListTile(
                      leading: Icon(
                        Icons.circle,
                        color: statusColors[status]!,
                        size: 16,
                      ),
                      title: Text(
                        status[0].toUpperCase() + status.substring(1),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: statusColors[status]!,
                        ),
                      ),
                    );
                  },
                ),

                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Change deposit status",
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
                  ),
                ),

                onChanged: (value) => setState(() => selectedStatus = value),
              ),

              const SizedBox(height: 25),

              Center(
                child: InkWell(
                  onTap: _submitForm,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF00BC7D), Color(0xFF00BBA7)],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.file_upload_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          widget.deposit == null
                              ? "Submit Deposit"
                              : "Update Deposit",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
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

  Widget _buildTipsSection() {
    return Card(
      color: Colors.blue[50],
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.lightbulb_outline, color: Colors.amber),
                SizedBox(width: 8),
                Text(
                  "Tips for Better Rewards",
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
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
