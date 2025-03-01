import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/view/auth/login_page.dart';
import 'package:wins_pkr/view/earn_money/earn_money_tab.dart';
import 'package:wins_pkr/view/home/home.dart';
import 'package:wins_pkr/view/me/me_page.dart';
import 'package:wins_pkr/view/new_pages_by_harsh/deposit_screen.dart';
import 'package:wins_pkr/view/promotion/promotion_tab.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  final int? paymentSelected;

  const BottomNavBar({super.key, this.initialIndex = 0, this.paymentSelected});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;
  List<Widget> _pages = [];
  String? userId;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _loadUserId();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileViewModel>(context, listen: false).userProfileApi(context);
    });
  }

  Future<void> _loadUserId() async {
    UserViewModel userViewModel = UserViewModel();
    String? fetchedUserId = await userViewModel.getUser();
    setState(() {
      userId = fetchedUserId;
      _pages = _buildPages();
    });
  }

  List<Widget> _buildPages() {
    if (userId == null) {
      return [
        const HomeScreen(),
        const EarnMoneyTab(),
        const Login(),
        const Login(),
        const Login(),
      ];
    } else {
      return [
        const HomeScreen(),
        const EarnMoneyTab(),
        const PromotionTab(),
        const WalletScreen(),
        const MeScreen(),
      ];
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildIcon(String assetPath, int index) {
    bool isSelected = _selectedIndex == index;
    return Container(
      padding: const EdgeInsets.all(8),
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: isSelected ? AppColors.buttonGradient4 : null,
      ),
      child: Image.asset(
        assetPath,
        color: isSelected ? Colors.white : Colors.grey,
      ),
    );
  }

  Widget _buildMiddleIcon(String assetPath, int index) {
    bool isMiddleIcon = index == 2;
    bool isSelected = _selectedIndex == index;
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.transparent,
      child: isMiddleIcon
          ? Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.appButton,
        ),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.transparent,
          child: Image.asset(
            assetPath,
            width: 30,
            height: 30,
            color: Colors.white,
          ),
        ),
      )
          : CircleAvatar(
        radius: 25,
        backgroundColor:
        isSelected ? Colors.orangeAccent : Colors.transparent,
        child: Image.asset(
          assetPath,
          width: 30,
          height: 30,
          color: isSelected ? Colors.white : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _pages = _buildPages();

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 65,
        decoration: const BoxDecoration(
          gradient: AppColors.appBarGradient,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            BottomNavigationBar(
              selectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
              backgroundColor: Colors.transparent,
              elevation: 10,
              items: [
                BottomNavigationBarItem(
                  icon: _buildIcon(Assets.iconsHome, 0),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(Assets.iconsEarnMoney, 1),
                  label: 'Activity',
                ),
                const BottomNavigationBarItem(
                  icon: SizedBox(height: 24, width: 24),
                  label: 'Promotion',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(Assets.iconsWalletBg, 3),
                  label: 'Wallet',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(Assets.iconsProfile, 4),
                  label: 'Me',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              onTap: _onItemTapped,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
            ),
            Positioned(
              bottom: 30,
              child: GestureDetector(
                onTap: () => _onItemTapped(2),
                child: _buildMiddleIcon(Assets.iconsDiamond, 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
