import axios from 'axios';

const URL = 'http://192.168.0.2:4000';

export const api = axios.create({
  baseURL: URL,
});
