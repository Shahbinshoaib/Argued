// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

//Text()
const String kshopName = "Shop-Name";

//Routes Name

const String kLoginScreen = '/login';
const String kSignUpScreen = '/signup';
const String kSplashScreen = '/splashscreen';
const String kHomeScreen = '/homescreen';
const String kContactScreen = '/Contactscreen';
const String kGroupScreen = '/Groupscreen';
const String kCreateGroupScreen = '/CreateGroup';
const String kEditProfileScreen = '/editProfile';
const String kViewerDashBoardScreen = '/VDashBoard';
const String kWatchListScreen = '/WatchList';
const String kChatScreen = '/ChatScreen';
const String kGroupChatScreen = '/GroupChatScreen';
const String kInviteContactScreen = '/InviteContact';
const String kUserOpinionScreen = '/UsrOpinionScreen';
const String kSingleOpinionScreen = '/SingleOpinionScreen';
const String kProfileOpinion = '/api/user/profile-with-opinions/';

// animation
const kAnimationDuration = Duration(milliseconds: 200);

//padding
const double kbaseHorizontalPadding = 20.0;
const double kbaseVerticalPadding = 8.0;

//url
const String kendpoint = 'https://argued.com';
// const String kendpoint = 'http://34.235.85.190';
const String ksignUp = '/api/user/signup-mobile';
const String kLogin = '/api/user/login';
const String kverifyCode = '/api/user/verify-user';
const String kCheckUsername = '/api/user/check-username';
const String kforgotUsername = '/api/user/forgotUsername';
const String kforgotPassword = '/api/user/forgotPassword';
const String kHotTopicHour = '/api/opinion/hotest';
const String kMostWatched = '/api/opinion/most-watched';
const String kInterestingToYou = '/api/opinion/lates?page=';
const String kRateOpinion = '/api/opinion/rating/';
const String kProfile = '/api/user/profile';
const String kCountry = '/api/country';
const String kStates = '/api/country/statesWithCities/';
const String kCategory = '/api/category';
const String kContact = '/api/user/contacts';
const String kChatRoom = '/api/chat-room/messages/';
const String kInviteContact = '/api/user/by-username/';
const String kAddContact = '/api/contact-requests';
const String kGroups = '/api/group/my-groups/';
const String kGroupRequest = '/api/group-requests';
const String kGroupMessages = '/api/group/messages/';
const String kGroupMessagesread = '/api/group/read/';
const String kChatMessagesread = '/api/user/read/';
const String kCreateGroup = '/api/group';
const String kAddHost = '/api/user/follow/';
const String kApiVersion = '/api/public/check-api-version/v1.0.0.1';
const String kTempImage =
    "https://www.colorbook.io/imagecreator.php?width=300&height=300?hex=0xadd8e6";

//HiveDB
const String loginBox = 'loginBox';
