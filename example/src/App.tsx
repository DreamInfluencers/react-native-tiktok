import React, { useEffect } from 'react';
import { Button, StyleSheet, View } from 'react-native';
import { auth, init, events } from 'react-native-tiktok';

export default function App() {
  useEffect(() => {
    const authListener = events.addListener('onAuthCompleted', (resp) => {
      console.log(resp.code);
      console.log(resp.status);
    });
    return () => {
      // @ts-ignore
      events.remove(authListener)();
    };
  }, []);

  const startConnection = () => {
    init('aw4cxi3r4cn9s9hj');
    auth('xxxx', (code, error, errMsg) => {
      console.log(code, error, errMsg);
    });
  };
  return (
    <View style={styles.container}>
      <Button onPress={startConnection} title="Auth" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
