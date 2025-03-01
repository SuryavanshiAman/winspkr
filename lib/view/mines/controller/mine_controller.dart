import 'dart:math';

import 'package:flutter/cupertino.dart';

class MineController with ChangeNotifier {
  TextEditingController amountCon = TextEditingController();
  int _selectedBet = 0;
  int get selectedBet => _selectedBet;

  void setSelectedBet(int val) {
    _selectedBet = val;
    amountCon.text = betAmountList[selectedBet].toString();
    notifyListeners();
  }

  List<int> betAmountList = [10, 20, 50, 100, 200, 500, 1000, 5000];

  void incrementCounter() {
    int currentValue = int.parse(amountCon.text);
    if (currentValue < 5000) {
      currentValue += 1;
      amountCon.text = currentValue.toString();
    }
    notifyListeners();
  }

  void decrementCounter() {
    int currentValue = int.parse(amountCon.text);
    if (currentValue > 10) {
      currentValue -= 1;
      amountCon.text = currentValue.toString();
    }
    notifyListeners();
  }

  int _selectedMine = 3;
  int get selectedMine => _selectedMine;

  void setSelectedMine(int val) {
    _selectedMine = val;
    notifyListeners();
  }

  bool _cashOut = false;
  bool get cashOut => _cashOut;
  void setCashOut(bool val) {
    _cashOut = val;
    notifyListeners();
  }

  bool _gameLost = false;
  bool get gameLost => _gameLost;
  void setGameLost(bool val) {
    _gameLost = val;
    notifyListeners();
  }

  bool _isTapped = false;
  bool get isTapped => _isTapped;
  void setIsTapped(bool val) {
    _isTapped = val;
    notifyListeners();
  }

  int _selectedLength = 0;
  int get selectedLength => _selectedLength;
  void setSelectedLength(int val) {
    _selectedLength = val;
    notifyListeners();
  }

  double _amountValue = 0.0;
  double get amountValue => _amountValue;
  void setAmountValue(double val) {
    _amountValue = val;
    notifyListeners();
  }

  //  set game data
  int rows = 5;
  int columns = 5;
  List<List<bool>> grid = [];
  List<bool> selectedCells = [];

  void initializeGrid() {
    grid = List.generate(rows, (_) => List.filled(columns, false));
    selectedCells = List.filled(rows * columns, false);

    // Place mines randomly
    final random = Random();
    int minesPlaced = 0;
    while (minesPlaced < selectedMine) {
      final index = random.nextInt(rows * columns);
      if (!grid[index ~/ columns][index % columns]) {
        grid[index ~/ columns][index % columns] = true;
        minesPlaced++;
      }
    }
    notifyListeners();
  }

  // refresh game
  void refreshGame() {
    initializeGrid();
    _amountValue = 0.0;
    _selectedLength = 0;
    _isTapped = false;
    _gameLost = false;
    notifyListeners();
  }


  void updateSelectedCell(int index, bool value) {
    if (index >= 0 && index < selectedCells.length) {
      selectedCells[index] = value;
      notifyListeners();
    }
  }
}
