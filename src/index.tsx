import { NativeModules, NativeEventEmitter, Platform } from 'react-native';
import { response } from './response';

const { Tiktok } = NativeModules;

type ResponseType = {
  status: number;
  code: string;
};

export const auth = (
  stateKey: string,
  callback: (code: string, error: boolean | null, errMsg: string) => void
) => {
  Tiktok.auth(stateKey, (resp: ResponseType) => {
    if (Platform.OS === 'ios') {
      switch (resp.status) {
        case response.success:
          callback(resp.code, false, '');
          break;
        case response.networkError:
          callback('', true, 'Network Error');
          break;
        case response.authDenied:
          callback('', true, 'Auth Denied');
          break;
        case response.unsupported:
          callback('', true, 'Unsupported');
          break;
        default:
          null;
      }
    } else {
      callback('', null, '');
    }
  });
};


export const init = (key: string) => {
  if (Platform.OS === 'android') {
    Tiktok.init(key);
  }
};

const addListener = (_listener: string, _event: any) => {};

export const events =
  Platform.OS === 'android' ? new NativeEventEmitter(Tiktok) : { addListener };
