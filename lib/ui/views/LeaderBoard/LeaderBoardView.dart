import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:rollanddice/ui/shared/app_colors.dart';
import 'package:rollanddice/ui/shared/app_theme.dart';
import 'package:rollanddice/ui/views/BaseCommonWidget.dart';
import 'package:rollanddice/ui/shared/size_config.dart';
import 'package:rollanddice/services/Firebase.dart';
import 'package:rollanddice/models/Users.dart';
import 'dart:async';
import 'package:rollanddice/ui/widgets/custom_appbar.dart';
import 'package:rollanddice/ui/views/LeaderBoard/LeaderBoardViewModel.dart';

class LeaderBoardView extends StatefulWidget {
  @override
  _LeaderBoardViewState createState() => _LeaderBoardViewState();
}

class _LeaderBoardViewState extends State<LeaderBoardView>
    with BaseCommonWidget {
  Stream<QuerySnapshot> leaderBoardRef = FirebaseService.firebaseFirestore
      .collection("LeaderBoard")
      .orderBy("score")
      .snapshots();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LeaderBoardViewModel>.withConsumer(
      viewModel: LeaderBoardViewModel(context),
      builder: (ct, model, child) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: _getBody(model),
          appBar: CustomAppBar(
            text: "LeaderBoard",
            elevation: 0.5,
            textColor: AppColors.black,
            centerTitle: true,
          ),
        );
      },
      onModelReady: (model) async {},
    );
  }

  Widget _getBody(LeaderBoardViewModel model) {
    return Stack(
      children: <Widget>[
        ///Main Body
        _getBaseContainer(model),

        ///Progress Indicator
        getProgressBar(model.state),
      ],
    );
  }

  _getBaseContainer(LeaderBoardViewModel model) {
    return Padding(
      padding: AppTheme.getContentPadding(),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.dividerColor),
              borderRadius: BorderRadius.all(
                Radius.elliptical(70, 70),
              ),
            ),
            height: SizeConfig.relativeHeight(6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                borderContainer(title: 'Rank', left: 5, fontWeight: FontWeight.bold,),
                Expanded(
                  child: borderContainer(
                      title: 'Name',
                      alignment: Alignment.centerLeft,
                      left: 5,
                      right: 5, fontWeight: FontWeight.bold,),
                ),
                borderContainer(title: 'Score', right: 5, fontWeight: FontWeight.bold,),
              ],
            ),
          ),
          SizeConfig.verticalSpacer(3),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: leaderBoardRef,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    return ListView.separated(
                      itemCount: snapshot.data.docs.reversed.length,
                      itemBuilder: (context, index) {
                        model.users = User.fromMap(
                            snapshot.data.docs.reversed.toList()[index].data());
                        return listItem(
                          name: model.users.fullName,
                          attempt: model.users.attemptRemain.toString(),
                          rank: index + 1,
                          score: model.users.score.toString(),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizeConfig.verticalSpacer(0.5);
                      },
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem({int rank, String name, String attempt, String score}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.dividerColor),
          borderRadius: BorderRadius.all(Radius.elliptical(70, 70))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          borderContainer(
              title: rank.toString(),
              left: 10,
              fontSize: 16,
              fontWeight: FontWeight.bold,
          color:  Colors.red),
          Expanded(
            child: borderContainer(
                title: name,
                alignment: Alignment.centerLeft,
                left: 8,
                right: 5),
          ),
          borderContainer(title: score, right: 5,  fontWeight: FontWeight.bold,
              color:  Colors.black),
        ],
      ),
    );
  }

  Widget borderContainer(
      {String title,
      AlignmentGeometry alignment = Alignment.center,
      double left = 0,
      double right = 0,
      double fontSize = 14,
      FontWeight fontWeight = FontWeight.w400,
      Color color = Colors.black}) {
    return Container(
      alignment: alignment,
      padding: EdgeInsets.only(
          left: SizeConfig.relativeWidth(left),
          right: SizeConfig.relativeWidth(right),
          top: SizeConfig.relativeHeight(1),
          bottom: SizeConfig.relativeHeight(1)),
      // height: SizeConfig.relativeHeight(6),

      child: Text(
        title,
        style: TextStyle(
            fontSize: SizeConfig.setSp(fontSize),
            fontWeight: fontWeight,
            color: color),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
