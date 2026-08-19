#!/bin/bash
echo "== Spider-Man 2 Android 14 Yerel Yukleyici Baslatiliyor =="

PACKAGE="com.gameloft.android.ANMP.GloftASHM"
APK_PATH="/sdcard/Download/spiderman2.apk"
OBB_SRC="/sdcard/Download/$PACKAGE"
OBB_DST="/sdcard/Android/obb/"

# 1. Eski Hatalı Verileri Temizle
echo "[1/4] Eski onbellek ve veri kilitleri sifirlaniyor..."
adb shell pm clear $PACKAGE 2>/dev/null
adb shell pm uninstall $PACKAGE 2>/dev/null

# 2. Android 14 SDK Engelini Aşarak Yükle
echo "[2/4] APK sisteme enjekte ediliyor..."
adb shell pm install --bypass-low-target-sdk-block -g -r "$APK_PATH"

# 3. OBB Klasörünü Doğru İzinlerle Yerleştir
echo "[3/4] OBB butunlugu saglaniyor..."
adb shell mkdir -p "$OBB_DST"
adb shell mv "$OBB_SRC" "$OBB_DST"

# 4. Depolama İzinlerini Manuel Tanımla (GameInstaller Çökmesini Önler)
echo "[4/4] Donanimsal depolama izinleri zorla ataniyor..."
adb shell pm grant $PACKAGE android.permission.READ_EXTERNAL_STORAGE 2>/dev/null
adb shell pm grant $PACKAGE android.permission.WRITE_EXTERNAL_STORAGE 2>/dev/null

echo "== ISLEM BASARIYLA TAMAMLANDI =="
echo "NOT: Oyunu acmadan once interneti kapatip Ucak Moduna alin!"
