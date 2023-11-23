part of '../page.dart';

class _GeneralSection extends StatelessWidget {
  const _GeneralSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubTitleText('General'),
        Dimens.dp16.height,
        // _tile('Privacy & Policy', onTap: () {
        //   Navigator.push(
        //     context,
        //     CupertinoPageRoute(
        //       builder: (context) => WebViewPage(
        //         appBar: AppBar(title: const Text('Privacy & Policy')),
        //         url: 'https://shamo.donisaputra.com/privacy-policy',
        //       ),
        //     ),
        //   );
        // }),
        // _tile('Term of Service', onTap: () {
        //   Navigator.push(
        //     context,
        //     CupertinoPageRoute(
        //       builder: (context) => WebViewPage(
        //         appBar: AppBar(title: const Text('Term of Service')),
        //         url: 'https://shamo.donisaputra.com/term',
        //       ),
        //     ),
        //   );
        // }),
        BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, theme) {
            return _tile('Change Theme', onTap: () {
              context.read<ThemeBloc>().add(
                    ThemeChanged(
                      theme.theme == AppTheme.light
                          ? AppTheme.dark
                          : AppTheme.light,
                    ),
                  );
            });
          },
        ),
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
