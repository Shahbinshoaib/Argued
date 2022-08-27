import 'package:argued/backend/contact_service.dart';
import 'package:argued/model/chatModel.dart';
import 'package:argued/model/contactModel.dart';
import 'package:argued/model/findCOntactModel.dart';
import 'package:rxdart/rxdart.dart';

class ContactBloc {
  ContactBloc() {
    {
      _searchContact
          .debounce((_) => TimerStream(true, Duration(milliseconds: 500)))
          .listen((query) async {
        if (query.isNotEmpty) {
          var response = await await contactService.findContact(query);

          if (response['code'] == 200) {
            var obj = FindContactModel.fromJson(response);
            print("Length =====>>${obj.data.length}");
            _findContact.add(obj);
          } else {
            _findContact.addError(response['message']);
          }
        } else {
          _findContact.addError('');
        }
      });
    }
  }

  //variable
  ContactService contactService = ContactService();
  final _contacts = BehaviorSubject<ContactModel>();
  final _chatMessages = BehaviorSubject<ChatModel>();
  final _findContact = BehaviorSubject<FindContactModel>();
  final _searchQuery = BehaviorSubject<String>();
  final _searchContact = BehaviorSubject<String>();
  final _addContact = BehaviorSubject<Map<dynamic, dynamic>>();
  //Streams
  Stream<ContactModel> get contacts => _contacts.stream;
  Stream<FindContactModel> get findContacts => _findContact.stream;
  Stream<Map<dynamic, dynamic>> get addContact => _addContact.stream;
  Stream<ChatModel> get chatMessages => _chatMessages.stream;
  Stream<String> get searchQuery => _searchQuery.stream;
  Stream<String> get searchContact => _searchContact.stream;

  //Sink
  Function(ContactModel) get changeContacts => _contacts.sink.add;
  Function(FindContactModel) get changeFindContacts => _findContact.sink.add;
  Function(Map<dynamic, dynamic>) get changeAddContacts => _addContact.sink.add;
  Function(ChatModel) get changeChatMessages => _chatMessages.sink.add;
  Function(String) get changeSearchQuery => _searchQuery.sink.add;
  Function(String) get changeSearchContact => _searchContact.sink.add;

  //dispose
  dispose() {
    _findContact.close();
    _addContact.close();
    _searchQuery.close();
    _searchContact.close();
    _contacts.close();
    _chatMessages.close();
  }

  //func
  getContact() async {
    _contacts.addError('loading');
    var data = await contactService.getContact();
    changeContacts(data);
  }

  getChatRoom(String roomId) async {
    var data = await contactService.getChatRoom(roomId);
    changeChatMessages(data);
    await contactService.chatMessageRead(roomId);
    getContact();
  }

  addToContact(String userName) async {
    var data = await contactService.addContact(userName);
    _addContact.add(data);
  }
}
