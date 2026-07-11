#!/bin/bash
# হিফজুল কুরআন — Android & iOS সেটআপ স্ক্রিপ্ট
# এই ফাইলটি চালান: bash setup.sh

echo "================================================"
echo "  হিফজুল কুরআন অ্যাপ সেটআপ শুরু হচ্ছে..."
echo "================================================"

# Step 1: www ফোল্ডার তৈরি
echo ""
echo "📁 Step 1: www ফোল্ডার তৈরি করছি..."
mkdir -p www

# Step 2: HTML ফাইল কপি
echo "📄 Step 2: HTML ফাইল কপি করছি..."
if [ -f "quran_hifz.html" ]; then
    cp quran_hifz.html www/index.html
    cp manifest.json www/manifest.json 2>/dev/null || echo "manifest.json পাওয়া যায়নি"
    echo "✅ HTML ফাইল কপি সম্পন্ন"
else
    echo "⚠️  quran_hifz.html পাওয়া যায়নি!"
    echo "   অনুগ্রহ করে quran_hifz.html এই ফোল্ডারে রাখুন"
    exit 1
fi

# Step 3: npm install
echo ""
echo "📦 Step 3: Dependencies ইনস্টল করছি..."
npm install

# Step 4: Android যোগ করুন
echo ""
echo "🤖 Step 4: Android প্রজেক্ট তৈরি করছি..."
npx cap add android 2>/dev/null || echo "Android ইতিমধ্যে আছে"
npx cap sync android

# Step 5: iOS যোগ করুন (Mac only)
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo ""
    echo "🍎 Step 5: iOS প্রজেক্ট তৈরি করছি..."
    npx cap add ios 2>/dev/null || echo "iOS ইতিমধ্যে আছে"
    npx cap sync ios
else
    echo ""
    echo "ℹ️  iOS শুধু Mac এ build করা যায়"
fi

echo ""
echo "================================================"
echo "  ✅ সেটআপ সম্পন্ন!"
echo "================================================"
echo ""
echo "পরবর্তী ধাপ:"
echo ""
echo "Android:"
echo "  1. Android Studio খুলুন"
echo "  2. চালান: npx cap open android"
echo "  3. Build > Generate Signed APK"
echo ""
if [[ "$OSTYPE" == "darwin"* ]]; then
echo "iOS:"
echo "  1. Xcode খুলুন"
echo "  2. চালান: npx cap open ios"
echo "  3. Product > Archive"
echo ""
fi
echo "PWA (সহজতম):"
echo "  1. netlify.com এ www ফোল্ডার আপলোড করুন"
echo "  2. Chrome এ 'Add to Home Screen' করুন"
echo ""
