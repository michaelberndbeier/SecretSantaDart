import 'dart:math';

class Pairing
{
  String sender = "";
  String receiver = "";

  Pairing(String _sender, String _receiver)
  {
    this.sender = _sender;
    this.receiver = _receiver;
  }
}

List getSenders(List _participants)
{
  var senders = _participants;
  senders.shuffle();
  return senders;
}

List getParticipants()
{
	var participants = ["Michael", "Alice", "Bob", "Charlie", "Diana", "Eliot", "Felix"];
		return participants;
}

int getOffset(int _numParticipants)
{
  Random random = new Random();
  // adjust, so there is no 0 offset -> prohobit from people gifting themselfs
  return random.nextInt(_numParticipants - 1) + 1;

}

int calcReceiverIndex(int _senderIndex, int _numParticipants, int _offset)
{
  var virtualIndex = _senderIndex + _offset;
  var adjustedIndex = virtualIndex % _numParticipants;

  return adjustedIndex;
}

Pairing buildPairing(List _senders, int _numParticipants,
                     int _offset,  MapEntry _sender)
                     {

    int senderIndex = _sender.key;
    String sender = _sender.value;
    int receiverIndex = calcReceiverIndex(senderIndex, _numParticipants, _offset);
    String receiver = _senders[receiverIndex];

    Pairing pairing = new Pairing(sender, receiver);
    return pairing;
                     }

List getPairings(List _senders)
{
  
  var numParticipants = _senders.length;
  var offset = getOffset(numParticipants);

  var receivers = _senders.asMap().entries.map((entry)
  {
    return buildPairing(_senders, numParticipants, 
                          offset, entry);
  }
  );

  return receivers.toList();
}

void printPairings(List _pairings)
{

  _pairings.forEach((element) {
    print('${element.sender} -> ${element.receiver}');
  });

}