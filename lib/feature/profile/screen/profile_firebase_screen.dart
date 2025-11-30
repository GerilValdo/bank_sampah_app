import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/helpers/image_helper.dart';
import 'package:bank_sampah_app/core/router/app_router.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/bloc/firebase_auth_bloc.dart';
import 'package:bank_sampah_app/feature/deposit/presentation/bloc/deposit_firebase_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfileFirebaseScreen extends StatefulWidget {
  const ProfileFirebaseScreen({super.key});
  static const String id = '/profile-firebase';

  @override
  State<ProfileFirebaseScreen> createState() => _ProfileFirebaseScreenState();
}

class _ProfileFirebaseScreenState extends State<ProfileFirebaseScreen> {
  bool notificationsEnabled = true;

  bool _isEditDialogOpen = false;

  @override
  void initState() {
    super.initState();

    context.read<FirebaseAuthBloc>().add(const FirebaseAuthEvent.loadUser());

    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      context.read<DepositFirebaseBloc>().add(
        DepositFirebaseEvent.loadDeposits(uid),
      );
    }
  }

  
  // EDIT PROFILE DIALOG
  
  void _showEditProfileDialog(user) {
    final usernameCtrl = TextEditingController(text: user.username);
    final phoneCtrl = TextEditingController(text: user.phoneNumber ?? "");
    final addressCtrl = TextEditingController(text: user.address ?? "");

    File? selectedImageFile; 
    String? existingPhoto = user.profileImage; 

    _isEditDialogOpen = true;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              backgroundColor: const Color(0xFFF2F8F6),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 28,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0DA18C),
                        ),
                      ),
                      const SizedBox(height: 22),

                      // FOTO PROFILE 
                      Center(
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  builder: (_) => SafeArea(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: const Icon(
                                            Icons.photo_library,
                                          ),
                                          title: const Text(
                                            "Pick from Gallery",
                                          ),
                                          onTap: () async {
                                            final file =
                                                await ImageHelper.pickGallery();
                                            if (file != null) {
                                              setStateDialog(() {
                                                selectedImageFile = file;
                                                existingPhoto = null;
                                              });
                                            }
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.camera_alt),
                                          title: const Text("Take a Photo"),
                                          onTap: () async {
                                            final file =
                                                await ImageHelper.pickCamera();
                                            if (file != null) {
                                              setStateDialog(() {
                                                selectedImageFile = file;
                                                existingPhoto = null;
                                              });
                                            }
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.grey.shade300,
                                backgroundImage: selectedImageFile != null
                                    ? FileImage(selectedImageFile!)
                                          as ImageProvider
                                    : (existingPhoto != null
                                          ? NetworkImage(existingPhoto!)
                                          : null),
                                child:
                                    (selectedImageFile == null &&
                                        existingPhoto == null)
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            "Upload",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      )
                                    : null,
                              ),
                            ),

                            if (selectedImageFile != null ||
                                existingPhoto != null)
                              Positioned(
                                right: 0,
                                top: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    setStateDialog(() {
                                      selectedImageFile = null;
                                      existingPhoto = null;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      const SizedBox(height: 22),

                      _buildInputField(
                        label: "Username",
                        controller: usernameCtrl,
                      ),
                      const SizedBox(height: 16),

                      _buildInputField(
                        label: "Phone Number",
                        controller: phoneCtrl,
                        inputType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16),

                      _buildInputField(
                        label: "Address",
                        controller: addressCtrl,
                      ),
                      const SizedBox(height: 28),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                color: Color(0xFF9BA4AE),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),

                          BlocBuilder<FirebaseAuthBloc, FirebaseAuthState>(
                            builder: (context, state) {
                              final isLoading = state.maybeWhen(
                                loading: () => true,
                                orElse: () => false,
                              );

                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0DA18C),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 26,
                                    vertical: 12,
                                  ),
                                ),
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        context.read<FirebaseAuthBloc>().add(
                                          FirebaseAuthEvent.updateProfile(
                                            username: usernameCtrl.text.trim(),
                                            phoneNumber: phoneCtrl.text.trim(),
                                            address: addressCtrl.text.trim(),
                                            imageFile: selectedImageFile,
                                          ),
                                        );
                                      },
                                child: isLoading
                                    ? const SizedBox(
                                        height: 18,
                                        width: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Text(
                                        "Save",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ).then((_) {
      _isEditDialogOpen = false;
    });
  }

  
  // INPUT FIELD UI
  
  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    TextInputType inputType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            keyboardType: inputType,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  

  
  @override
  Widget build(BuildContext context) {
    return BlocListener<FirebaseAuthBloc, FirebaseAuthState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (msg) {
            if (_isEditDialogOpen && Navigator.canPop(context)) {
              Navigator.pop(context);
              _isEditDialogOpen = false;
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(msg), backgroundColor: Colors.green),
            );

            context.read<FirebaseAuthBloc>().add(
              const FirebaseAuthEvent.loadUser(),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFB),
        body: BlocBuilder<FirebaseAuthBloc, FirebaseAuthState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              unauthenticated: () =>
                  const Center(child: Text("You are logged out")),

              // USER LOADED
              authenticated: (user) {
                return ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildHeader(context, user),
                    const SizedBox(height: 20),
                    _buildPersonalInfoSection(user),
                    const SizedBox(height: 24),
                    _buildLogoutButton(),
                    const SizedBox(height: 30),
                  ],
                );
              },

              error: (e) => Center(child: Text(e)),
              success: (_) => const SizedBox(),
            );
          },
        ),
      ),
    );
  }

  
  // HEADER
  
  Widget _buildHeader(BuildContext context, user) {
    final initials = _getInitials(user.username);

    return Container(
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF10B981), Color(0xFF14B8A6)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: Colors.white24,
                backgroundImage: user.profileImage != null
                    ? NetworkImage(user.profileImage!)
                    : null,
                child: user.profileImage == null
                    ? Text(
                        initials,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.username,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Member since ${_formatDate(user.createdAt)}",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: () => _showEditProfileDialog(user),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.edit, color: Colors.white, size: 18),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          BlocBuilder<DepositFirebaseBloc, DepositFirebaseState>(
            builder: (context, depState) {
              final approvedDeposits = depState.deposits
                  .where((d) => d.status.toLowerCase() == "completed")
                  .toList();

              final totalWeights = approvedDeposits.fold(
                0.0,
                (sum, d) => sum + d.weight,
              );

              final totalDeposits = approvedDeposits.length;

              final user = context.read<FirebaseAuthBloc>().state.maybeWhen(
                authenticated: (u) => u,
                orElse: () => null,
              );

              final totalPoints = user?.totalPoints ?? 0;

              return Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _SummaryItem(value: '$totalPoints', label: 'Total Points'),
                    _SummaryItem(
                      value: '$totalDeposits',
                      label: 'Total Deposits',
                    ),
                    _SummaryItem(
                      value: totalWeights.toStringAsFixed(1),
                      label: 'Total Weight (kg)',
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  
  // INFO SECTION
  
  Widget _buildPersonalInfoSection(user) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: _cardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal Information',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const SizedBox(height: 16),

            _buildInfoTile(
              icon: Icons.email,
              label: 'Email',
              value: user.email,
              color: Colors.teal,
            ),

            Divider(height: 24, color: Colors.black.withValues(alpha: 0.2)),

            _buildInfoTile(
              icon: Icons.phone,
              label: 'Phone',
              value: "+62 ${user.phoneNumber}",
              color: Colors.indigo,
            ),

            Divider(height: 24, color: Colors.black.withValues(alpha: 0.2)),

            _buildInfoTile(
              icon: Icons.location_on,
              label: 'Address',
              value: user.address ?? "Not set",
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  
  // LOGOUT BUTTON
  
  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Logout'),
              content: const Text('Are you sure you want to logout?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    context.read<FirebaseAuthBloc>().add(
                      const FirebaseAuthEvent.logout(),
                    );
                    context.replaceRoute(const FirebaseLoginRoute());
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: _cardDecoration(),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout, color: Colors.red),
              SizedBox(width: 8),
              Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  // HELPERS
  
  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.green.withValues(alpha: 0.08),
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Row(
      children: [
        _iconBox(icon, color),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _iconBox(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }

  String _getInitials(String name) {
    final parts = name.split(" ");
    if (parts.length == 1) return parts[0][0];
    return "${parts[0][0]}${parts[1][0]}".toUpperCase();
  }

  String _formatDate(DateTime? date) {
    if (date == null) return "-";
    return "${date.day}/${date.month}/${date.year}";
  }
}

// SUMMARY ITEM
class _SummaryItem extends StatelessWidget {
  final String value;
  final String label;
  const _SummaryItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ],
    );
  }
}
