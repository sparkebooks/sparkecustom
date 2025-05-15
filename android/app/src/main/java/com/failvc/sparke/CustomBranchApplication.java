package com.failvc.sparke2;

import android.app.Application;
import io.branch.referral.Branch;

public class CustomBranchApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        // Optional, turn on Branch logging while debugging
        Branch.enableLogging();
        // Kick off the Branch init
        Branch.getAutoInstance(this);
        Branch.setFBAppID("613777494861103");
    }
}
