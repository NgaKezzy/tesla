import 'package:flutter/material.dart';
import 'package:telsa_mobile/features/other/employee/widgets/build_employee_row.dart';
import 'package:telsa_mobile/features/other/models/employee/group_employee.dart';

class GroupEmployeeWidget extends StatefulWidget {
  const GroupEmployeeWidget({
    super.key,
    required this.groupEmployee,
  });

  final GroupEmployee groupEmployee;

  @override
  State<GroupEmployeeWidget> createState() => _GroupEmployeeWidgetState();
}

class _GroupEmployeeWidgetState extends State<GroupEmployeeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isExpanded = true; // Mặc định là true

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.groupEmployee.role,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  const Color(0xFFF6F6F6),
                ),
              ),
              icon: AnimatedBuilder(
                animation: _animation,
                builder: (_, child) {
                  return Transform.rotate(
                    angle: _animation.value * 3.14159,
                    child: child,
                  );
                },
                child: const Icon(
                  Icons.keyboard_arrow_up,
                  // Thay đổi icon mặc định thành mũi tên lên
                  color: Color(0xFF555555),
                ),
              ),
              onPressed: _toggleExpanded,
            ),
          ],
        ),
        AnimatedBuilder(
          animation: _animation,
          builder: (_, child) {
            return ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: _animation.value,
                child: Opacity(
                  opacity: _animation.value,
                  child: child,
                ),
              ),
            );
          },
          child: _buildEmployeeList(
            voidCallback: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildEmployeeList({VoidCallback? voidCallback}) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 12),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.groupEmployee.employees.length,
      itemBuilder: (context, index) {
        return BuildEmployeeRow(
          employee: widget.groupEmployee.employees[index],
        );
      },
    );
  }
}
