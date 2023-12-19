import { ExpoConfig, ConfigContext } from "@expo/config";
import packageJson from "./package.json";

const CLERK_PUBLISHABLE_KEY =
  "pk_test_c3F1YXJlLWdyaXp6bHktODQuY2xlcmsuYWNjb3VudHMuZGV2JA";

const defineConfig = (_ctx: ConfigContext): ExpoConfig => ({
  name: "expo",
  slug: "expo",
  scheme: "com.honeymoon.app",
  version: packageJson.version,
  orientation: "portrait",
  icon: "./assets/icon.png",
  userInterfaceStyle: "light",
  splash: {
    image: "./assets/icon.png",
    resizeMode: "contain",
    backgroundColor: "#2e026d",
  },
  updates: {
    fallbackToCacheTimeout: 0,
  },
  assetBundlePatterns: ["**/*"],
  ios: {
    supportsTablet: true,
    bundleIdentifier: "com.honeymoon.app",
  },
  android: {
    adaptiveIcon: {
      foregroundImage: "./assets/icon.png",
      backgroundColor: "#2e026d",
    },
  },
  extra: {
    eas: {
      projectId: "3e52cf18-0ec2-42e5-b827-c9597358b8f0",
      owner: "ayocodes",
    },
    CLERK_PUBLISHABLE_KEY,
  },
  plugins: ["./expo-plugins/with-modify-gradle.js"],
});

export default defineConfig;
