# 📱 হিফজুল কুরআন — Android & iOS অ্যাপ গাইড

## সহজতম উপায় — Capacitor (HTML থেকে সরাসরি অ্যাপ)

আপনার তৈরি HTML ফাইলকে Capacitor দিয়ে Android ও iOS অ্যাপে রূপান্তর করুন।
কোনো React Native শিখতে হবে না।

---

## ধাপ ১: প্রয়োজনীয় সফটওয়্যার ইনস্টল

### Windows এ:
```bash
# Node.js ইনস্টল করুন (nodejs.org থেকে)
# Android Studio ইনস্টল করুন (developer.android.com/studio)
# Java JDK 17 ইনস্টল করুন
```

### Mac এ (iOS এর জন্য):
```bash
# Xcode App Store থেকে ইনস্টল করুন
# Node.js ইনস্টল করুন
brew install node
```

---

## ধাপ ২: প্রজেক্ট তৈরি

```bash
# একটি ফোল্ডার তৈরি করুন
mkdir HifzApp
cd HifzApp

# Capacitor ইনস্টল করুন
npm init -y
npm install @capacitor/core @capacitor/cli
npm install @capacitor/android @capacitor/ios

# Capacitor initialize করুন
npx cap init "হিফজুল কুরআন" "com.hifz.quran" --web-dir www
```

---

## ধাপ ৩: HTML ফাইল রাখুন

```bash
# www ফোল্ডার তৈরি করুন
mkdir www

# আপনার quran_hifz.html ফাইলটি www ফোল্ডারে রাখুন
# এবং নাম পরিবর্তন করুন:
cp quran_hifz.html www/index.html

# manifest.json ও রাখুন
cp manifest.json www/
```

---

## ধাপ ৪: Android অ্যাপ তৈরি

```bash
# Android প্রজেক্ট যোগ করুন
npx cap add android

# Android Studio তে খুলুন
npx cap open android

# Android Studio তে:
# Build > Generate Signed Bundle/APK > APK
# অথবা Run > Run 'app' (USB connected phone এ)
```

---

## ধাপ ৫: iOS অ্যাপ তৈরি (Mac only)

```bash
# iOS প্রজেক্ট যোগ করুন
npx cap add ios

# Xcode তে খুলুন
npx cap open ios

# Xcode তে:
# Product > Archive > Distribute App
```

---

## capacitor.config.json (এটি তৈরি হবে automatically)

```json
{
  "appId": "com.hifz.quran",
  "appName": "হিফজুল কুরআন",
  "webDir": "www",
  "bundledWebRuntime": false,
  "plugins": {
    "SplashScreen": {
      "launchShowDuration": 2000,
      "backgroundColor": "#0d1117",
      "androidSplashResourceName": "splash",
      "androidScaleType": "CENTER_CROP"
    },
    "StatusBar": {
      "style": "DARK",
      "backgroundColor": "#0d1117"
    }
  }
}
```

---

## বিকল্প — Netlify + PWA (সহজতম)

Play Store ছাড়াই অ্যাপের মতো ব্যবহার করতে:

1. **netlify.com** এ যান
2. Account তৈরি করুন (বিনামূল্যে)
3. quran_hifz.html এবং manifest.json drag & drop করুন
4. আপনার URL পাবেন যেমন: https://hifzapp.netlify.app
5. Android Chrome এ খুলুন → "Add to Home Screen"
6. iPhone Safari এ খুলুন → Share → "Add to Home Screen"

---

## Google Play Store এ দেওয়ার জন্য

1. **Google Play Console**: play.google.com/console
2. Account fee: $25 (একবারই)
3. APK/AAB আপলোড করুন
4. App তথ্য পূরণ করুন
5. Review এর পর 3-7 দিনে live

---

## Apple App Store এর জন্য

1. **Apple Developer Program**: developer.apple.com
2. বার্ষিক fee: $99
3. Mac + Xcode লাগবে
4. App Store Connect এ আপলোড
5. Review 1-3 দিন

---

## সবচেয়ে দ্রুত উপায় — PWA Builder

1. **pwabuilder.com** এ যান
2. আপনার Netlify URL দিন
3. "Start" ক্লিক করুন
4. Android বা iOS প্যাকেজ ডাউনলোড করুন
5. সরাসরি Play Store এ আপলোড করুন!

---

## প্রয়োজনীয় ফাইল চেকলিস্ট

- ✅ quran_hifz.html (মূল অ্যাপ)
- ✅ manifest.json (PWA manifest)
- ⬜ icon-192.png (অ্যাপ আইকন ১৯২x১৯২)
- ⬜ icon-512.png (অ্যাপ আইকন ৫১২x৫১২)
- ⬜ splash.png (স্প্লাশ স্ক্রিন)

---

## সাহায্য দরকার হলে

প্রতিটি ধাপে সাহায্য করব।
Claude কে বলুন: "Netlify তে কীভাবে upload করব?"
