plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.graduation_project"
    compileSdk = flutter.compileSdkVersion
    
    // *** تم التعديل هنا: تحديد إصدار NDK المطلوب صراحةً ***
    ndkVersion = "27.0.12077973" 

    compileOptions {
        // *** تم التعديل هنا: تحديد إصدار Java 17 للتوافق مع Java 21 ***
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        // *** تم التعديل هنا: تحديد jvmTarget لـ Java 17 ***
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.graduation_project"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 23 // تم تحديد minSdk إلى 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// **[MODIFIED - التعديل الرئيسي هنا]** هذا القسم تم تعديله ليتناسب مع صيغة Kotlin DSL
dependencies { // هذا البلوك بتاع الـ dependencies

    // **[مهم جداً]** الأسطر الأصلية الموجودة في قسم الـ dependencies بتاعك لازم تكون موجودة هنا.
    // عادةً بتكون أسطر زي:
    // implementation(project(":some_plugin_name"))
    // implementation("com.google.android.material:material:x.y.z")
    // لا تحذف أي شيء من الأسطر الأصلية هنا!

    // **[التصحيح الرئيسي]**
    // إضافة هذه الأسطر لتحديد إصدارات ثابتة وموثوقة لمكتبات AndroidX
    // **تأكد أن الأقواس "( )" موجودة حول كل dependency وأنها داخل بلوك الـ dependencies.**
    implementation("androidx.annotation:annotation:1.6.0") // << صيغة Kotlin DSL الصحيحة
    implementation("androidx.core:core-ktx:1.10.1")       // << صيغة Kotlin DSL الصحيحة
    implementation("androidx.concurrent:concurrent-futures:1.1.0") // << صيغة Kotlin DSL الصحيحة
    implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.6.2") // << صيغة Kotlin DSL الصحيحة

    // لو احتجت تضيف دول في المستقبل، لازم بنفس الصيغة:
    // implementation("androidx.security:security-crypto:1.1.0-alpha03")
    // implementation("androidx.biometric:biometric:1.1.0")
    // implementation("androidx.fragment:fragment:1.3.6")
}