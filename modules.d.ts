// Define types for our .env
declare namespace NodeJS {
  export interface ProcessEnv {
    MONGODB_URI: string;
    MONGODB_USER: string;
    MONGODB_PASS: string;
  }
}
