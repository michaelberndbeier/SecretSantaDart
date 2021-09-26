import 'package:secret_santa_cli/secretSanta.dart';

void main(List<String> arguments) {
	
	var senders = getSenders(getParticipants());
	var pairings = getPairings(senders);
	printPairings(pairings);
}
