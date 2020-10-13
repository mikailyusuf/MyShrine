// class ChartScreen extends StatefulWidget {
//   @override
//   _ChartScreenState createState() => _ChartScreenState();
// }
//
// class _ChartScreenState extends State<ChartScreen> with TickerProviderStateMixin {
//   final TextEditingController _textController = TextEditingController();
//   final List<ChatMessage> _message = [];
//   final FocusNode _focusNode = FocusNode();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("MY CHATS"),
//         ),
//         body: Column(
//           children: [
//             Flexible(
//               child: ListView.builder(
//                 padding: EdgeInsets.all(8.0),
//                 reverse: true,
//                 itemBuilder: (_, int index) => _message[index],
//                 itemCount: _message.length,
//               ),
//             ),
//             Divider(
//               height: 1.0,
//             ),
//             Container(
//               decoration: BoxDecoration(color: Theme.of(context).cardColor),
//               child: _buildTextComposer(),
//             ),
//           ],
//         ));
//   }
//
//   Widget _buildTextComposer() {
//     return IconTheme(
//       data: IconThemeData(color: Theme.of(context).accentColor),
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 8.0),
//         child: Row(
//           children: [
//             Flexible(
//               child: TextField(
//                 focusNode: _focusNode,
//                 controller: _textController,
//                 onSubmitted: _handleSubmitted,
//                 decoration:
//                 InputDecoration.collapsed(hintText: "Enter Your Message"),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 4.0),
//               child: IconButton(
//                 icon: const Icon(Icons.send),
//                 onPressed: () => _handleSubmitted(_textController.text),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _handleSubmitted(String text) {
//     _textController.clear();
//     ChatMessage chatMessage = ChatMessage(
//       text: text,
//       animationController: AnimationController(
//         Duration: const Duration(milliseconds: 700), // NEW
//         vsync: this,
//       ),
//     );
//     setState(() {
//       _message.insert(0, chatMessage);
//     });
//     _focusNode.requestFocus();
//     message.animationController.forward();
//
//   }
// }
//
// class ChatMessage extends StatelessWidget {
//   ChatMessage({this.text,this.animationController});
//   final AnimationController animationController;
//   final String text;
//   String _name = "Mikail Yusuf";
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             margin: const EdgeInsets.only(right: 16.0),
//             child: CircleAvatar(
//               child: Text(_name[0]),
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 _name,
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 5.0),
//                 child: Text(text),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }