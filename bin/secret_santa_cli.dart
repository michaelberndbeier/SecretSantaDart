import 'package:secret_santa_cli/secretSanta.dart';

void main(List<String> arguments) {
	
  print("Secret Santa started");
	var senders = getSenders(getParticipants());
	var pairings = getPairings(senders);
	printPairings(pairings);
}
