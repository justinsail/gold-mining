import './global.css';
import { GestureHandlerRootView } from 'react-native-gesture-handler';
import AppNavigator from './src/navigation/AppNavigator';

export default function App() {
  return (
    <GestureHandlerRootView className="flex-1">
      <AppNavigator />
    </GestureHandlerRootView>
  );
}
