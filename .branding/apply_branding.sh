#!/usr/bin/env bash
set -euo pipefail

BRANDING_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$BRANDING_DIR/.." && pwd)"

APP_NAME="$(cat "$BRANDING_DIR/app_name.txt" | tr -d '\r\n')"
NEW_APP_ID="${1:-com.kasundsilva.flex}"

echo "==> Applying branding: $APP_NAME ($NEW_APP_ID)"

# 1. Update app_name in strings.xml
sed -i.bak "s|<string name=\"app_name\" translatable=\"false\">.*</string>|<string name=\"app_name\" translatable=\"false\">$APP_NAME</string>|g" "$ROOT_DIR/app/src/main/res/values/strings.xml"
sed -i.bak "s|<string name=\"app_name_long\" translatable=\"false\">.*</string>|<string name=\"app_name_long\" translatable=\"false\">$APP_NAME</string>|g" "$ROOT_DIR/app/src/main/res/values/strings.xml"
rm -f "$ROOT_DIR/app/src/main/res/values/strings.xml.bak"

# 2. Update banner and launcher background color to OLED black
sed -i.bak "s|#000B25|#000000|g" "$ROOT_DIR/app/src/main/res/values/ic_banner_background.xml"
rm -f "$ROOT_DIR/app/src/main/res/values/ic_banner_background.xml.bak"
sed -i.bak "s|#101010|#000000|g" "$ROOT_DIR/app/src/main/res/values/ic_launcher_background.xml"
rm -f "$ROOT_DIR/app/src/main/res/values/ic_launcher_background.xml.bak"

# 3. Copy TV Banners
cp "$BRANDING_DIR/banners/ic_banner.png" "$ROOT_DIR/app/src/main/res/mipmap-xhdpi/ic_banner.png"
cp "$BRANDING_DIR/banners/ic_banner_foreground.png" "$ROOT_DIR/app/src/main/res/mipmap-xhdpi/ic_banner_foreground.png"

# 4. Replace launcher icons across all mipmap densities
for d in mdpi hdpi xhdpi xxhdpi xxxhdpi; do
  TARGET_DIR="$ROOT_DIR/app/src/main/res/mipmap-$d"
  if [ -d "$TARGET_DIR" ]; then
    rm -f "$TARGET_DIR"/ic_launcher*.webp
    cp "$BRANDING_DIR/icons/mipmap-$d"/ic_launcher*.png "$TARGET_DIR/"
  fi
done

# 5. Copy splash logo and window background
cp "$BRANDING_DIR/icons/flex_logo.png" "$ROOT_DIR/app/src/main/res/drawable/flex_logo.png"
cp "$BRANDING_DIR/splash_background.xml" "$ROOT_DIR/app/src/main/res/drawable/splash_background.xml"
if ! grep -q "android:windowBackground" "$ROOT_DIR/app/src/main/res/values/themes.xml"; then
  sed -i.bak "s|</style>|    <item name=\"android:windowBackground\">@drawable/splash_background</item>\n    </style>|g" "$ROOT_DIR/app/src/main/res/values/themes.xml"
  rm -f "$ROOT_DIR/app/src/main/res/values/themes.xml.bak"
fi

# 6. Update Application ID in build.gradle.kts
sed -i.bak "s|applicationId = \"com.github.damontecres.wholphin\"|applicationId = \"$NEW_APP_ID\"|g" "$ROOT_DIR/app/build.gradle.kts"
rm -f "$ROOT_DIR/app/build.gradle.kts.bak"

# 7. Make Base64 keystore decoding lenient to newlines and whitespace
sed -i.bak "s|Base64\.getDecoder()|Base64\.getMimeDecoder()|g" "$ROOT_DIR/app/build.gradle.kts"
rm -f "$ROOT_DIR/app/build.gradle.kts.bak"

# 8. Rebrand crash dialog in WholphinApplication.kt
sed -i.bak "s|Wholphin has crashed!|Flex has crashed!|g" "$ROOT_DIR/app/src/main/java/com/github/damontecres/wholphin/WholphinApplication.kt"
sed -i.bak "s|Wholphin Crash Report|Flex Crash Report|g" "$ROOT_DIR/app/src/main/java/com/github/damontecres/wholphin/WholphinApplication.kt"
rm -f "$ROOT_DIR/app/src/main/java/com/github/damontecres/wholphin/WholphinApplication.kt.bak"

echo "==> Branding applied successfully!"
