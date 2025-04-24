import 'package:auto_route/auto_route.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whisprr_mobile/core/utils/color_theme.utils.dart';
import 'package:whisprr_mobile/core/utils/cutom_colors.dart';
import 'package:whisprr_mobile/dic/injection.dart';
import 'package:whisprr_mobile/features/authentication/data/bloc/auth_bloc.dart';
import 'package:whisprr_mobile/features/authentication/data/bloc/theme/theme_bloc.dart';
import 'package:whisprr_mobile/features/authentication/presentation/widgets/AuthDetails.widget.dart';
import 'package:whisprr_mobile/features/authentication/usecases/theme/change_theme.usecase.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class HomeNavPage {
  const HomeNavPage({required this.screenRoute, required this.navItem});

  final PageRouteInfo<dynamic> screenRoute;
  final IconData navItem;
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // late TabsRouter tabsRouter;

  late ThemeBloc _themeBloc;
  late AuthBloc _authBloc;

  late ChangeThemeUsecase _changeThemeUsecase;
  // late GetUsersUsecase _getUsersUsecase;
  // late GetChatsUsecase _getChatsUsecase;

  // late MediaQueryData _mediaQuery;
  late TabController _tabController;
  late TextEditingController _messageController;
  late ScrollController _scrollController;
  late List<String> _messages = <String>[];
  final String text = """
 Okay, let's break down how AI works, in a way that's easy to understand.  It's a big field, so we'll cover the main concepts and then touch on some specifics.\n\n**The Basic Idea: Mimicking Intelligence**\n\nAt its core, Artificial Intelligence (AI) is about creating machines that can perform tasks that typically require human intelligence. This includes things like:\n\n*   **Learning:**  Improving performance over time based on data.\n*   **Reasoning:**  Solving problems and making decisions.\n*   **Problem-solving:** Finding solutions to new and complex issues.\n*   **Perception:** Understanding sensory input (like images, sound, or text).\n*   **Natural Language Processing:** Understanding and generating human language.\n\n**Key Components & Techniques:**\n\nAI isn't one single thing; it's an umbrella term that encompasses various techniques. Here are some of the most important ones:\n\n1.  **Machine Learning (ML):**\n\n    *   **What it is:** This is the most common approach to AI today. Instead of explicitly programming a machine to do something, you feed it data and let it *learn* the patterns and relationships within that data.\n\n    *   **How it works:**  ML algorithms use statistical techniques to build a model from data. This model can then be used to make predictions or decisions on new data.\n\n    *   **Types of Machine Learning:**\n\n        *   **Supervised Learning:**  You give the algorithm labeled data (data with the correct answers). The algorithm learns to map inputs to outputs.  *Example: Training a model to identify pictures of cats by showing it many pictures of cats labeled \"cat\" and pictures of other things labeled \"not cat.\"*\n        *   **Unsupervised Learning:** You give the algorithm unlabeled data. The algorithm tries to find patterns or structure in the data on its own. *Example: Grouping customers into segments based on their purchasing behavior without knowing what those segments are beforehand.*\n        *   **Reinforcement Learning:**  The algorithm learns by trial and error. It interacts with an environment and receives rewards or penalties for its actions. The goal is to learn a strategy that maximizes the rewards. *Example: Training a computer to play a game by rewarding it for winning and penalizing it for losing.*\n\n2.  **Neural Networks and Deep Learning:**\n\n    *   **What they are:** Neural networks are a type of machine learning model inspired by the structure of the human brain. They consist of interconnected nodes (neurons) that process information. Deep learning is a type of neural network with many layers (hence \"deep\").\n\n    *   **How they work:**  Data is fed into the input layer of the network, and it passes through the layers, with each layer performing computations and transforming the data. The output layer produces the final result. The network learns by adjusting the connections between the neurons based on the data it's trained on.\n\n    *   **Why they're powerful:** Deep learning models are particularly good at handling complex data like images, audio, and text. They can automatically learn features from the data, which means you don't have to manually engineer those features.\n\n3.  **Natural Language Processing (NLP):**\n\n    *   **What it is:** This is the field of AI that deals with understanding and generating human language.\n\n    *   **How it works:** NLP techniques involve analyzing the structure and meaning of text, as well as using machine learning to train models that can perform tasks like:\n\n        *   **Text classification:** Determining the category of a text (e.g., spam detection, sentiment analysis).\n        *   **Machine translation:** Translating text from one language to another.\n        *   **Question answering:** Answering questions based on a text.\n        *   **Text summarization:** Creating a concise summary of a text.\n        *   **Chatbots:**  Creating conversational agents that can interact with humans.\n\n4.  **Computer Vision:**\n\n    *   **What it is:**  This field focuses on enabling computers to \"see\" and interpret images and videos.\n\n    *   **How it works:**  Computer vision techniques often involve using machine learning (especially deep learning) to train models that can perform tasks like:\n\n        *   **Image recognition:** Identifying objects in an image.\n        *   **Object detection:** Locating objects in an image and drawing bounding boxes around them.\n        *   **Image segmentation:** Dividing an image into different regions.\n        *   **Facial recognition:** Identifying people in an image.\n\n5.  **Rule-Based Systems (Expert Systems):**\n\n    *   **What they are:**  These systems use a set of predefined rules to make decisions.\n\n    *   **How they work:**  A knowledge engineer interviews experts in a particular field and encodes their knowledge into a set of \"if-then\" rules. When a new situation arises, the system applies the rules to the situation to reach a conclusion.\n\n    *   **Example:** A medical diagnosis system that uses rules to diagnose diseases based on symptoms.\n\n    *   **Limitations:**  Rule-based systems can be difficult to create and maintain, and they may not be able to handle situations that were not explicitly anticipated by the rules. They are less flexible than machine learning approaches.\n\n**The AI Development Process (Simplified):**\n\n1.  **Define the Problem:**  What task do you want the AI to perform? (e.g., identify fraudulent transactions, recommend products, drive a car).\n2.  **Gather Data:** Collect relevant data that the AI can learn from. The more data, the better (usually). This is critical! Data quality is also essential.\n3.  **Choose an Algorithm/Technique:** Select the appropriate AI technique based on the problem and the available data (e.g., supervised learning, deep learning, NLP).\n4.  **Train the Model:**  Feed the data into the algorithm and let it learn the patterns.  This involves adjusting the model's parameters to minimize errors.\n5.  **Evaluate the Model:** Test the model on a separate set of data to see how well it performs.  Evaluate its accuracy, precision, recall, and other relevant metrics.\n6.  **Deploy the Model:**  Put the model into use in a real-world setting.\n7.  **Monitor and Retrain:** Continuously monitor the model's performance and retrain it with new data as needed to improve its accuracy and keep it up-to-date.\n\n**Important Considerations:**\n\n*   **Data is King:** The quality and quantity of data are crucial for the success of any AI project. Garbage in, garbage out!\n*   **Bias:**  AI models can inherit biases from the data they are trained on. It's important to be aware of these biases and take steps to mitigate them.  This is a huge ethical concern.\n*   **Explainability:** Some AI models (especially deep learning models) can be difficult to understand. This can make it hard to trust their decisions, especially in critical applications.  Research into \"explainable AI\" (XAI) is a growing area.\n*   **Computational Resources:** Training AI models can require significant computational resources (e.g., powerful GPUs).\n*   **Ethics:** AI raises important ethical questions about privacy, fairness, accountability, and safety.\n\n**Levels of AI (Simplified):**\n\n*   **Narrow or Weak AI:**  Designed to perform a specific task (e.g., playing chess, recommending products). This is the type of AI we have today.\n*   **General or Strong AI:**  Possesses human-level intelligence and can perform any intellectual task that a human being can.  This is still largely theoretical.\n*   **Super AI:**  Surpasses human intelligence in all aspects.  This is also theoretical and raises significant existential questions.\n\n**In Summary:**\n\nAI is a powerful technology that has the potential to transform many aspects of our lives. It works by using various techniques, primarily machine learning, to enable machines to learn from data and perform tasks that typically require human intelligence. However, it's important to be aware of the limitations and ethical considerations associated with AI and to use it responsibly.\n
""";

  @override
  void initState() {
    super.initState();

    _themeBloc = getIt<ThemeBloc>();
    _authBloc = getIt<AuthBloc>();

    _changeThemeUsecase = getIt<ChangeThemeUsecase>();

    _tabController = TabController(length: 2, vsync: this);
    _messageController = TextEditingController();
    _scrollController = ScrollController();
    _messages = <String>[];
    _messages.add(text);
    // _getUsersUsecase = getIt<GetUsersUsecase>();
    // _getChatsUsecase = getIt<GetChatsUsecase>();

    // _getUsersUsecase.execute();
    // _getChatsUsecase.execute(_authBloc.state.loginDatas?.uid ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final ColorTheme colorTheme = getIt<ColorThemeUtils>().getColors(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset:
            false, // avoid the navbar coming up when the keyboad is open
        backgroundColor: colorTheme.white_blueGrey,
        body: Stack(
          children: <Widget>[
            Scaffold(
              key: _scaffoldKey,
              backgroundColor: Colors.transparent,
              appBar: _appBar,
              drawer: _drawer(),
              body: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(10),
                      reverse: true, // Messages appear from bottom to top
                      itemCount: _messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        bool isMe = false;
                        return Align(
                          alignment: isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isMe
                                  ? CustomColors.darkOrange
                                  : Colors.transparent,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(10),
                                topRight: const Radius.circular(10),
                                bottomLeft: isMe
                                    ? const Radius.circular(10)
                                    : Radius.zero,
                                bottomRight: isMe
                                    ? Radius.zero
                                    : const Radius.circular(10),
                              ),
                            ),
                            child: isMe
                                ? Text(
                                    _messages[index],
                                    style: TextStyle(
                                      color: isMe ? Colors.white : Colors.black,
                                    ),
                                  )
                                : parseAIResponse(_messages[index]),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            decoration: InputDecoration(
                              hintText: 'Type a message...',
                              filled: true,
                              suffixIconColor: CustomColors.darkOrange,
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.arrow_circle_up_rounded,
                                  size: 30,
                                  color: CustomColors.darkOrange,
                                ),
                                onPressed: _sendMessage,
                              ),
                              fillColor: Colors.grey[200], // Background color
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                ), // Transparent border when unfocused
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: CustomColors.darkOrange,
                                ), // Change this if you want a different focus effect
                                borderRadius: BorderRadius.circular(30),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ), // Change this if you want a different error effect
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ), // Change this if you want a different error effect
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            style: TextStyle(
                              color: colorTheme.grey500_black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // BaseBody(
              //   child: DashChat(
              //     currentUser: ChatUser(id: '1', firstName: 'User'),
              //     messageOptions: MessageOptions(
              //       avatarBuilder: (ChatUser user, Function? a, Function? b) {
              //         return const Padding(
              //           padding: EdgeInsets.only(left: 5, right: 5),
              //           child: SizedBox(
              //             // height: 40,
              //             child: Stack(
              //               children: <Widget>[
              //                 CircleAvatar(
              //                   backgroundColor: Colors.white,
              //                   child: Image(
              //                     image: AssetImage('assets/images/bot.png'),
              //                     width: 30,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       },
              //       currentUserContainerColor: CustomColors.darkOrange,
              //       maxWidth: MediaQuery.of(context).size.width * 0.7,
              //     ),
              //     messages: <ChatMessage>[
              //       ChatMessage(
              //         text: parseAIResponse(""),
              //         user: ChatUser(
              //           id: '2',
              //           firstName: '2.0 Flash-Lite',
              //         ),
              //         createdAt:
              //             DateTime.now().subtract(const Duration(minutes: 5)),
              //       ),
              //       ChatMessage(
              //         text: 'I have a question about my account.',
              //         user: ChatUser(id: '1', firstName: 'User'),
              //         createdAt:
              //             DateTime.now().subtract(const Duration(minutes: 3)),
              //       ),
              //       ChatMessage(
              //         text: 'Sure, please go ahead.',
              //         user: ChatUser(
              //           id: '2',
              //           firstName: '2.0 Flash-Lite',
              //         ),
              //         createdAt:
              //             DateTime.now().subtract(const Duration(minutes: 2)),
              //       ),
              //     ],
              //     onSend: (ChatMessage message) {
              //       // Handle sending messages
              //     },
              //   ),
              // ),
            ),
            // const AppVersionOptionPage(),
          ],
        ),
      ),
    );
  }

  Widget _drawer() {
    return const Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: AuthDetailsWidget(),
    );
  }

  Widget _body(Widget child) {
    final bool isSmallScreen = MediaQuery.of(context).size.height < 684;
    return ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width,
          height: _getConstraintsHeight(isSmallScreen, context),
        ),
        child: child);
  }

  PreferredSizeWidget get _appBar {
    final ColorTheme colorTheme = getIt<ColorThemeUtils>().getColors(context);
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        centerTitle: true,
        title: Container(
          // width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: <Widget>[
              TabBar(
                controller: _tabController,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.black,
                indicatorWeight: 0,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                dividerHeight: 0,
                tabs: <Widget>[
                  Tab(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(FluentIcons.sparkle_20_filled,
                            color: CustomColors.darkOrange),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            '2.0 Flash',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(FluentIcons.flash_20_filled,
                            color: CustomColors.darkOrange),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            '2.0 Flash-Lite',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        leading: Builder(builder: (BuildContext context) {
          return CircleAvatar(
            backgroundColor: Colors.transparent,
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: colorTheme.black_white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          );
        }),
        actions: <Widget>[
          _themeToggle,
        ],
        backgroundColor: colorTheme.white_blueGrey,
        elevation: 1.0,
        automaticallyImplyLeading: false,
      ),
    );
  }

  Widget get _themeToggle => BlocSelector<ThemeBloc, ThemeState, Brightness>(
        bloc: _themeBloc,
        selector: (ThemeState state) => state.theme,
        builder: (BuildContext context, Brightness state) {
          final ColorTheme colorTheme =
              getIt<ColorThemeUtils>().getColors(context);
          return InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              state == Brightness.light
                  ? _changeThemeUsecase.execute(Brightness.dark)
                  : _changeThemeUsecase.execute(Brightness.light);
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Icon(
                state == Brightness.light ? Icons.dark_mode : Icons.light_mode,
                color: colorTheme.black_white,
              ),
            ),
          );
        },
      );

  double _getConstraintsHeight(bool isSmallScreen, BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    const double appBarHeight = kToolbarHeight;
    const double bottomNavigationHeight = kBottomNavigationBarHeight;
    final double safeArea = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;

    final double heightToRemove =
        appBarHeight + safeArea + bottomNavigationHeight;

    return deviceHeight - heightToRemove;
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(_messageController.text.trim());
      });
      _messageController.clear();
    }
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        0.0, // Scroll to the first item
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  Widget parseAIResponse(String rawResponse) {
    if (rawResponse.isEmpty) return const SizedBox.shrink();

    try {
      final List<Widget> contentWidgets = [];

      final RegExp codeBlockPattern = RegExp(r'```(.*?)```', dotAll: true);
      int lastIndex = 0;

      final matches = codeBlockPattern.allMatches(rawResponse);

      for (final match in matches) {
        if (match.start > lastIndex) {
          final textPart = rawResponse.substring(lastIndex, match.start).trim();
          if (textPart.isNotEmpty) {
            contentWidgets.addAll(_splitParagraphs(textPart));
          }
        }

        final code = match.group(1)?.trim() ?? '';
        contentWidgets.add(_buildCodeBlock(code));
        lastIndex = match.end;
      }

      if (lastIndex < rawResponse.length) {
        final remainingText = rawResponse.substring(lastIndex).trim();
        if (remainingText.isNotEmpty) {
          contentWidgets.addAll(_splitParagraphs(remainingText));
        }
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: contentWidgets,
      );
    } catch (e) {
      print('Error parsing AI response: $e');
      return Text(
        rawResponse,
        style: const TextStyle(color: Colors.white),
      );
    }
  }

  List<Widget> _splitParagraphs(String text) {
    return text
        .split(RegExp(r'\n\s*\n')) // paragraph breaks
        .map((para) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: _buildMarkdownText(para.trim()),
            ))
        .toList();
  }

  Widget _buildMarkdownText(String text) {
    final List<InlineSpan> spans = [];

    final RegExp markdownPattern = RegExp(
      r'(\*\*.*?\*\*|\*[^*].*?\*|`.*?`|(\w[\w\s()]+:)\*)',
    );

    text.splitMapJoin(
      markdownPattern,
      onMatch: (match) {
        final matchedText = match.group(0)!;

        if (matchedText.endsWith(':*')) {
          final label = matchedText.substring(0, matchedText.length - 2);
          spans.add(TextSpan(
            text: '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ));
        } else if (matchedText.startsWith('**') && matchedText.endsWith('**')) {
          spans.add(TextSpan(
            text: matchedText.substring(2, matchedText.length - 2),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ));
        } else if (matchedText.startsWith('*') &&
            matchedText.endsWith('*') &&
            !matchedText.startsWith('**')) {
          spans.add(TextSpan(
            text: matchedText.substring(1, matchedText.length - 1),
            style: const TextStyle(fontStyle: FontStyle.italic),
          ));
        } else if (matchedText.startsWith('`') && matchedText.endsWith('`')) {
          spans.add(TextSpan(
            text: matchedText.substring(1, matchedText.length - 1),
            style: TextStyle(
              fontFamily: 'monospace',
              backgroundColor: Colors.grey[800],
              color: Colors.grey[100],
            ),
          ));
        }

        return '';
      },
      onNonMatch: (nonMatch) {
        spans.add(TextSpan(text: nonMatch));
        return '';
      },
    );

    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.grey, fontSize: 14),
        children: spans,
      ),
    );
  }

  Widget _buildCodeBlock(String code) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          code,
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 14.0,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
