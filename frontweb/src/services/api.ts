import axios from 'axios';

const LOCALHOST_URL = 'http://localhost:4000';

export const api = axios.create({
  baseURL: LOCALHOST_URL,
});
