import config from '../../env.config';
import pg from 'pg';

const { host, port, user, password, database } = config.db;
const { Pool } = pg;

export const query = async (sql: string, param: []) => {
    const pool = new Pool({
        user: user,
        password: password,
        database: database,
        host: host,
        port: Number(port),
    });

    try {
        const result = await pool.query(sql, param);
        return result.rows
            ;
    } catch (e) {
        return new Error((e as Error).message);
    }

};
