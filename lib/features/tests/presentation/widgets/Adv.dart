import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdButton extends StatefulWidget {
  const RewardedAdButton({super.key});

  @override
  State<RewardedAdButton> createState() => _RewardedAdButtonState();
}

class _RewardedAdButtonState extends State<RewardedAdButton> {
  RewardedAd? _rewardedAd;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadRewardedAd();
  }

  void _loadRewardedAd() {
    setState(() => _isLoading = true);

    RewardedAd.load(
      // adUnitId: 'ca-app-pub-2482501618515858/1617952891', // TEST ID
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            _rewardedAd = ad;
            _isLoading = false;
          });
        },
        onAdFailedToLoad: (error) {
          setState(() => _isLoading = false);
          print('Rewarded Ad failed to load: $error');
        },
      ),
    );
  }

  void _showRewardedAd() {
    if (_rewardedAd == null) return;

    _rewardedAd!.show(
      onUserEarnedReward: (ad, reward) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Siz ${reward.amount} ${reward.type} reward oldingiz!',
            ),
          ),
        );
      },
    );

    // Reklama ishlatilgach, yangi reklama yuklash
    _rewardedAd = null;
    _loadRewardedAd();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading ? null : _showRewardedAd,
      child: _isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : const Text('Darsni ochish (Reklama bilan)'),
    );
  }
}

// https://admob.google.com/v2/apps/2931034566/adunits/create
