import dotenv from 'dotenv';
dotenv.config();

const { DB_HOST,
    DB_PORT,
    DB_USER,
    DB_PASSWORD,
    DB_NAME,
    DB_DIALECT,
    APP_HOST,
    APP_PORT, } = process.env;

const config = {
    app: {
        port: APP_PORT || '4000',
        host: APP_HOST || '0.0.0.0'
    },
    db: {
        host: DB_HOST || '0.0.0.0',
        port: DB_PORT || '5432',
        user: DB_USER,
        password: DB_PASSWORD || 'postgres',
        database: DB_NAME,
        dialect: DB_DIALECT || 'postgres',
        pool: {
            max: 5,
            min: 0,
            acquire: 30000,
            idle: 10000,
        },
    }
}

export default config;