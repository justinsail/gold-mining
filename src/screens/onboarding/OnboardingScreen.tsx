import { View, Text, TouchableOpacity } from 'react-native';

export default function OnboardingScreen() {
  return (
    <View className="flex-1 bg-[#1a1a2e] items-center justify-center px-8">
      <Text className="text-[#f59e0b] text-5xl font-bold mb-3">✦</Text>
      <Text className="text-white text-3xl font-bold text-center mb-3">
        Gold Mining Circle
      </Text>
      <Text className="text-white/60 text-base text-center mb-12">
        Discover your purpose.{'\n'}Pursue it together.
      </Text>
      <TouchableOpacity className="bg-[#f59e0b] w-full py-4 rounded-2xl items-center mb-4">
        <Text className="text-white font-semibold text-base">Get Started</Text>
      </TouchableOpacity>
      <TouchableOpacity className="w-full py-4 rounded-2xl items-center border border-white/20">
        <Text className="text-white/80 font-semibold text-base">I already have an account</Text>
      </TouchableOpacity>
    </View>
  );
}
