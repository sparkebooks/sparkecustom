const connectOnSocialMediaReward = 10;
const watchAdReward = 10;
const createAccountReward = 30;
const referredAppInstallReward = 150;

int checkInStreakReward({required int streakDays}) => streakDays == 0 ? 10 : 20;
