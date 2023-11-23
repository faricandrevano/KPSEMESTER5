part of '../page.dart';

class _AccountSection extends StatelessWidget {
  const _AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubTitleText('Account'),
        Dimens.dp16.height,
        _tile('Edit Profile', onTap: () {
          Navigator.pushNamed(context, EditProfilePage.routeName);
        }),
        _tile('Your Orders', onTap: () {
          Navigator.pushNamed(context, TransactionPage.routeName);
        }),
        // _tile('Help', onTap: () {
        //   Navigator.push(
        //     context,
        //     CupertinoPageRoute(
        //       builder: (context) => WebViewPage(
        //         appBar: AppBar(title: const Text('Help')),
        //         url: 'https://shamo.donisaputra.com/help',
        //       ),
        //     ),
        //   );
        // }),
      ],
    );
  }

  Widget _tile(String title, {Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.dp12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RegularText(title),
            const Icon(Icons.arrow_forward_ios_rounded, size: 18),
          ],
        ),
      ),
    );
  }
}
