enum AuthState {login, register}
extension AuthStateExtension on AuthState{
  bool get isLogin => this == AuthState.login;
  bool get isRegister => this == AuthState.register;
}



enum NotificationType {account, community, app, miscellaneous,}
extension NotificationTypeExtension on NotificationType{
  String get getName => this.toString().toLowerCase().replaceAll("notificationtype.", "",);
  bool isEqualTo(String other){
    return this.toString().toLowerCase().contains(other.toLowerCase(),);
  }
}



enum MessageType {text, link, image, video,}
extension MessageTypeExtension on MessageType{
  String get getName => this.toString().toLowerCase().replaceAll("messagetype.", "",);
  bool isEqualTo(String other){
    return this.toString().toLowerCase().contains(other.toLowerCase(),);
  }
}