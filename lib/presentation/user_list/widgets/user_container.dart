part of '../user_list.dart';

class UserContainer extends StatelessWidget {
  final String userName;
  final String userImageUrl;
  final int reputation;
  final String location;
  final int userId;
  const UserContainer({
    super.key,
    required this.userId,
    required this.userName,
    required this.userImageUrl,
    required this.reputation,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppConstant.mediumSpacing,
              vertical: AppConstant.smallSpacing / 2),
          padding: EdgeInsets.symmetric(
              horizontal: AppConstant.mediumSpacing,
              vertical: AppConstant.smallSpacing),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[700]
                : Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(AppConstant.smallRadius),
            ),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[900]!
                      : Colors.grey[400]!,
                  offset: const Offset(3, 3),
                  blurRadius: 6.0),
            ],
          ),
          child: Row(
            children: [
              Container(
                  margin:
                      EdgeInsets.symmetric(vertical: AppConstant.smallSpacing),
                  height: AppConstant.mediumSpacing * 4,
                  width: AppConstant.mediumSpacing * 4,
                  child: CachedNetworkImage(imageUrl: userImageUrl)),
              SizedBox(width: AppConstant.mediumSpacing),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userName,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: AppConstant.smallSpacing / 2,
                    ),
                    Text('Address: $location'),
                    Text('Reputation: ${reputation.toString()}'),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.add))
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            RouteDefine.userReputationScreen.name,
            arguments:
                UserReputationFeatureModel(userId: userId, userName: userName),
          );
        });
  }
}
