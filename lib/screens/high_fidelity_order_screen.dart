import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HighFidelityOrderScreen extends StatefulWidget {
  const HighFidelityOrderScreen({Key? key}) : super(key: key);

  @override
  _HighFidelityOrderScreenState createState() =>
      _HighFidelityOrderScreenState();
}

class _HighFidelityOrderScreenState extends State<HighFidelityOrderScreen> {
  int _selectedOrderType = 0; // 0 for Deliver, 1 for Pick Up

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF2F2D2C)),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Order',
          style: GoogleFonts.sora(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2F2D2C),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              _buildOrderTypeSelector(),
              const SizedBox(height: 24),
              _buildDeliveryAddress(),
              const SizedBox(height: 16),
              const Divider(color: Color(0xFFE3E3E3), thickness: 1),
              const SizedBox(height: 16),
              _buildOrderItem(),
              const SizedBox(height: 20),
              Container(
                height: 4,
                color: const Color(0xFFF9F2ED),
              ),
              const SizedBox(height: 20),
              _buildDiscountCard(),
              const SizedBox(height: 20),
              _buildPaymentSummary(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildOrderTypeSelector() {
    return Container(
      height: 43,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEAEAEA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildOrderTypeButton('Deliver', 0),
          _buildOrderTypeButton('Pick Up', 1),
        ],
      ),
    );
  }

  Widget _buildOrderTypeButton(String title, int index) {
    bool isSelected = _selectedOrderType == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedOrderType = index),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFC67C4E) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.sora(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? Colors.white : const Color(0xFF2F2D2C),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Address',
          style: GoogleFonts.sora(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2F2D2C),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Jl. Kpg Sutoyo',
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF313131),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
          style: GoogleFonts.sora(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF9B9B9B),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildOutlinedButton(icon: Icons.edit, label: 'Edit Address'),
            const SizedBox(width: 8),
            _buildOutlinedButton(icon: Icons.note_add_outlined, label: 'Add Note'),
          ],
        ),
      ],
    );
  }

  Widget _buildOutlinedButton({required IconData icon, required String label}) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: const Color(0xFF313131), size: 16),
      label: Text(
        label,
        style: GoogleFonts.sora(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF313131),
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFF9B9B9B)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
    );
  }

  Widget _buildOrderItem() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.asset(
            'assets/images/I213_225_417_715.png',
            width: 54,
            height: 54,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Caffe Mocha',
              style: GoogleFonts.sora(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2F2D2C),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Deep Foam',
              style: GoogleFonts.sora(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF9B9B9B),
              ),
            ),
          ],
        ),
        const Spacer(),
        _buildQuantitySelector(),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        _buildQuantityButton(Icons.remove, const Color(0xFF9B9B9B)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            '1',
            style: GoogleFonts.sora(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2A2A2A),
            ),
          ),
        ),
        _buildQuantityButton(Icons.add, const Color(0xFF2A2A2A)),
      ],
    );
  }

  Widget _buildQuantityButton(IconData icon, Color color) {
    return InkWell(
      onTap: () {},
      customBorder: const CircleBorder(),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFEAEAEA)),
        ),
        child: Icon(icon, size: 16, color: color),
      ),
    );
  }

  Widget _buildDiscountCard() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFEAEAEA)),
        ),
        child: Row(
          children: [
            const Icon(Icons.local_offer_outlined, color: Color(0xFFC67C4E)),
            const SizedBox(width: 16),
            Text(
              '1 Discount is Applied',
              style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF313131),
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF2A2A2A)),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Summary',
          style: GoogleFonts.sora(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2F2D2C),
          ),
        ),
        const SizedBox(height: 16),
        _buildSummaryRow('Price', '\$ 4.53'),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              'Delivery Fee',
              style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF313131),
              ),
            ),
            Row(
              children: [
                Text(
                  '\$ 2.0',
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    color: const Color(0xFF2A2A2A),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '\$ 1.0',
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2F2D2C),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String title, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF313131),
          ),
        ),
        Text(
          amount,
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2F2D2C),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 16, 24, MediaQuery.of(context).padding.bottom + 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 20,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.account_balance_wallet_outlined, color: Color(0xFFC67C4E), size: 24),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cash/Wallet',
                    style: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2F2D2C),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$ 5.53',
                    style: GoogleFonts.sora(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFC67C4E),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_down, color: Color(0xFF2A2A2A)),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.push('/order_success'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC67C4E),
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              'Order',
              style: GoogleFonts.sora(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}