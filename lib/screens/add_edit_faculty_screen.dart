import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/faculty_model.dart';
import '../services/faculty_service.dart';
import '../utils/local_storage.dart';

class AddEditFacultyScreen extends StatefulWidget {
  final Faculty? faculty;

  const AddEditFacultyScreen({super.key, this.faculty});

  @override
  _AddEditFacultyScreenState createState() => _AddEditFacultyScreenState();
}

class _AddEditFacultyScreenState extends State<AddEditFacultyScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController dobController;
  late TextEditingController contactController;
  late TextEditingController deptController;
  late TextEditingController desgController;
  late TextEditingController addressController;
  bool _isLoading = false;
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    nameController = TextEditingController(text: widget.faculty?.name ?? '');
    emailController = TextEditingController(text: widget.faculty?.email ?? '');
    dobController = TextEditingController(
      text: widget.faculty?.dateOfBirth ?? '',
    );
    contactController = TextEditingController(
      text: widget.faculty?.contact ?? '',
    );
    deptController = TextEditingController(
      text: widget.faculty?.department ?? '',
    );
    desgController = TextEditingController(
      text: widget.faculty?.designation ?? '',
    );
    addressController = TextEditingController(
      text: widget.faculty?.address ?? '',
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    nameController.dispose();
    emailController.dispose();
    dobController.dispose();
    contactController.dispose();
    deptController.dispose();
    desgController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Add haptic feedback
      HapticFeedback.lightImpact();

      setState(() => _isLoading = true);
      final faculty = Faculty(
        id: widget.faculty?.id ?? 0,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        dateOfBirth: dobController.text.trim(),
        contact: contactController.text.trim(),
        department: deptController.text.trim(),
        designation: desgController.text.trim(),
        address: addressController.text.trim(),
      );

      try {
        if (widget.faculty == null) {
          await FacultyService.addFaculty(faculty);
          await LocalStorage.setLastFacultyName(faculty.name);
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.check_circle_rounded,
                          color: Colors.white, size: 18),
                    ),
                    const SizedBox(width: 12),
                    const Text('Faculty added successfully!',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                  ],
                ),
                backgroundColor: const Color(0xFFEA7300),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                margin: const EdgeInsets.all(16),
                elevation: 8,
              ),
            );
          }
        } else {
          await FacultyService.updateFaculty(
              widget.faculty!.id.toString(), faculty);
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.update_rounded,
                          color: Colors.white, size: 18),
                    ),
                    const SizedBox(width: 12),
                    const Text('Faculty updated successfully!',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                  ],
                ),
                backgroundColor: const Color(0xFFA62C2C),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                margin: const EdgeInsets.all(16),
                elevation: 8,
              ),
            );
          }
        }
        if (mounted) Navigator.pop(context);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.error_rounded,
                        color: Colors.white, size: 18),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text('Error: ${e.toString()}',
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                  ),
                ],
              ),
              backgroundColor: const Color(0xFFE83F25),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.all(16),
              elevation: 8,
            ),
          );
        }
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    } else {
      // Shake animation for validation errors
      HapticFeedback.heavyImpact();
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 25)),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFFA62C2C),
              onPrimary: Colors.white,
            ),
            dialogBackgroundColor: const Color(0xFFFFFBF5),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        dobController.text =
        "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = widget.faculty != null;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF5),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Custom App Bar
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            backgroundColor: const Color(0xFFA62C2C),
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white, size: 20),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.topRight,
                    radius: 1.2,
                    colors: [
                      Color(0xFFE83F25),
                      Color(0xFFA62C2C),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Decorative circles
                    Positioned(
                      top: -20,
                      right: -40,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -30,
                      left: -20,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.05),
                        ),
                      ),
                    ),
                    // Content
                    Positioned(
                      bottom: 30,
                      left: 20,
                      right: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEA7300),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              isEditMode ? Icons.edit_note_rounded : Icons.person_add_alt_1_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            isEditMode ? 'Edit Faculty' : 'New Faculty',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            isEditMode
                                ? 'Update faculty information'
                                : 'Add a new team member',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Form Content
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _slideAnimation,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Personal Information Section
                        _buildSectionCard(
                          title: 'Personal Information',
                          icon: Icons.person_outline_rounded,
                          color: const Color(0xFFA62C2C),
                          children: [
                            _buildTextField(
                              nameController,
                              'Full Name',
                              Icons.badge_outlined,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Please enter full name';
                                }
                                if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(val)) {
                                  return 'Name must contain only letters';
                                }
                                return null;
                              },
                            ),
                            _buildTextField(
                              emailController,
                              'Email Address',
                              Icons.alternate_email_rounded,
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Please enter email address';
                                }
                                final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                                if (!emailRegex.hasMatch(val)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            ),
                            GestureDetector(
                              onTap: _selectDate,
                              child: AbsorbPointer(
                                child: _buildTextField(
                                  dobController,
                                  'Date of Birth',
                                  Icons.cake_outlined,
                                  hintText: 'YYYY-MM-DD',
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Please select date of birth';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            _buildTextField(
                              contactController,
                              'Contact Number',
                              Icons.phone_outlined,
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Please enter contact number';
                                }
                                if (val.length < 10) {
                                  return 'Enter a valid 10-digit contact number';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Professional Information Section
                        _buildSectionCard(
                          title: 'Professional Details',
                          icon: Icons.work_outline_rounded,
                          color: const Color(0xFFEA7300),
                          children: [
                            _buildTextField(
                              deptController,
                              'Department',
                              Icons.domain_outlined,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Please enter department';
                                }
                                return null;
                              },
                            ),
                            _buildTextField(
                              desgController,
                              'Designation',
                              Icons.stars_outlined,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Please enter designation';
                                }
                                return null;
                              },
                            ),
                            _buildTextField(
                              addressController,
                              'Address',
                              Icons.home_outlined,
                              maxLines: 3,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Please enter address';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),

                        // Submit Button
                        Container(
                          width: double.infinity,
                          height: 64,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: _isLoading ? [] : [
                              BoxShadow(
                                color: const Color(0xFFD3CA79).withOpacity(0.4),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _submitForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _isLoading
                                  ? Colors.grey.shade400
                                  : const Color(0xFFD3CA79),
                              foregroundColor: const Color(0xFF2D2D2D),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: _isLoading
                                ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      const Color(0xFF2D2D2D),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  isEditMode ? 'Updating...' : 'Adding...',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            )
                                : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2D2D2D).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    isEditMode
                                        ? Icons.update_rounded
                                        : Icons.add_rounded,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  isEditMode ? 'Update Faculty' : 'Add Faculty',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Color color,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.1),
                  color.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller,
      String label,
      IconData icon, {
        TextInputType keyboardType = TextInputType.text,
        String? Function(String?)? validator,
        String? hintText,
        int maxLines = 1,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4A4A4A),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFFBF5),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFFD3CA79).withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              maxLines: maxLines,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2D2D2D),
              ),
              decoration: InputDecoration(
                hintText: hintText ?? 'Enter $label',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFFEA7300).withOpacity(0.2),
                        const Color(0xFFD3CA79).withOpacity(0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xFFA62C2C),
                    size: 20,
                  ),
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFFA62C2C),
                    width: 2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFFE83F25),
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFFE83F25),
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
              ),
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}