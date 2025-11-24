import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/router/app_router.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String id = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notificationsEnabled = true;

  @override
  void initState() {
    context.read<AuthBloc>().add(const AuthEvent.loadUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            unauthenticated: () =>
                const Center(child: Text("You are logged out")),

            /// ===============================
            /// USER BERHASIL AUTH → TAMPILKAN PROFILE
            /// ===============================
            authenticated: (user) {
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildHeader(context, user),
                  const SizedBox(height: 20),
                  _buildPersonalInfoSection(user),
                  const SizedBox(height: 16),
                  _buildSettingsSection(context),
                  const SizedBox(height: 24),
                  _buildLogoutButton(context),
                  const SizedBox(height: 30),
                ],
              );
            },

            success: (_) => const SizedBox(),
            error: (err) => Center(child: Text(err)),
          );
        },
      ),
    );
  }

  // ===============================
  // HEADER
  // ===============================
  Widget _buildHeader(BuildContext context, dynamic user) {
    final initials = _getInitials(user.name);

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

          // USER PROFILE ROW
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: CircleAvatar(
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
              ),
              const SizedBox(width: 12),

              // NAME + MEMBER SINCE
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
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

              // EDIT ICON
              GestureDetector(
                onTap: () {},
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

          // SUMMARY
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _SummaryItem(value: '${user.totalPoints}', label: 'Points'),
                _SummaryItem(value: user.email, label: 'Email'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===============================
  // PERSONAL INFO SECTION
  // ===============================
  Widget _buildPersonalInfoSection(dynamic user) {
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

            // ⭐ REPLACED ROLE → ADDRESS
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

  // ===============================
  // SETTINGS
  // ===============================
  Widget _buildSettingsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: _cardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const SizedBox(height: 16),

            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: _iconBox(Icons.notifications, Colors.amber),
              title: const Text('Notifications'),
              trailing: Switch(
                value: notificationsEnabled,
                onChanged: (v) => setState(() => notificationsEnabled = v),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===============================
  // LOGOUT
  // ===============================
  Widget _buildLogoutButton(BuildContext context) {
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
                    context.read<AuthBloc>().add(const AuthEvent.logout());
                    context.replaceRoute(const LoginRoute());
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

  // ===============================
  // REUSABLES
  // ===============================
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

// SUMMARY WIDGET --------------------------------------------------------

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
