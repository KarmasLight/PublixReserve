package com.publixreserve.app

import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.google.android.gms.ads.AdRequest
import com.google.android.gms.ads.LoadAdError
import com.google.android.gms.ads.MobileAds
import com.google.android.gms.ads.rewarded.RewardItem
import com.google.android.gms.ads.rewarded.RewardedAd
import com.google.android.gms.ads.rewarded.RewardedAdLoadCallback
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.database.FirebaseDatabase

class MainActivity : AppCompatActivity() {
    private var mRewardedAd: RewardedAd? = null
    private lateinit var pointsTextView: TextView
    private lateinit var watchAdButton: Button
    private val auth = FirebaseAuth.getInstance()
    private val database = FirebaseDatabase.getInstance()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Initialize Mobile Ads
        MobileAds.initialize(this) {}

        pointsTextView = findViewById(R.id.pointsTextView)
        watchAdButton = findViewById(R.id.watchAdButton)

        loadRewardedAd()
        setupAdButton()
        updatePointsDisplay()
    }

    private fun loadRewardedAd() {
        val adRequest = AdRequest.Builder().build()
        RewardedAd.load(this, "ca-app-pub-3940256099942544/5224354917", 
            adRequest, object : RewardedAdLoadCallback() {
                override fun onAdFailedToLoad(adError: LoadAdError) {
                    mRewardedAd = null
                }

                override fun onAdLoaded(rewardedAd: RewardedAd) {
                    mRewardedAd = rewardedAd
                }
            })
    }

    private fun setupAdButton() {
        watchAdButton.setOnClickListener {
            mRewardedAd?.let { ad ->
                ad.show(this) { rewardItem ->
                    // Reward the user
                    val rewardAmount = rewardItem.amount
                    addPointsToUser(rewardAmount)
                    Toast.makeText(this, "Earned $rewardAmount points!", Toast.LENGTH_SHORT).show()
                }
            } ?: run {
                Toast.makeText(this, "Ad not ready. Please try again.", Toast.LENGTH_SHORT).show()
                loadRewardedAd()
            }
        }
    }

    private fun addPointsToUser(points: Int) {
        val userId = auth.currentUser?.uid ?: return
        val userRef = database.reference.child("users").child(userId)
        
        userRef.child("points").get().addOnSuccessListener { snapshot ->
            val currentPoints = snapshot.getValue(Int::class.java) ?: 0
            userRef.child("points").setValue(currentPoints + points)
            updatePointsDisplay()
        }
    }

    private fun updatePointsDisplay() {
        val userId = auth.currentUser?.uid ?: return
        val userRef = database.reference.child("users").child(userId)
        
        userRef.child("points").get().addOnSuccessListener { snapshot ->
            val points = snapshot.getValue(Int::class.java) ?: 0
            pointsTextView.text = "Points: $points"
        }
    }
}
