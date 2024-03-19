sealed class Lang {
  final String playerNumber = "Number";
  final String playerName = "Name";
  final String playerFalls = "Falls";
  final String playerScore = "Score";
}

class LangRu implements Lang {
  @override
  final String playerNumber = "Номер";
  @override
  final String playerName = "Имя";
  @override
  final String playerFalls = "Фолы";
  @override
  final String playerScore = "Счет";
}
