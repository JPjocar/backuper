import {getConnection, mssql} from "./connection.js";

const getProducts = async () => {
    try {
        const pool = await getConnection();
        const date = new Date();
        const mls = Date.now();
        const backupName = `Backup ${date}@${mls}`.replaceAll(':', '-');
        const result = await pool.request().query('BACKUP DATABASE prueba TO DISK = N\'C:\\copias\\'+backupName+'\' WITH NOFORMAT, NOINIT, NAME = \'prueba\', SKIP, NOREWIND, NOUNLOAD, STATS = 10');
        if(pool) pool.close();
        console.log('Backup Realizado');
    } catch (error) {
        console.log(`Error: ${error}`);
    }
}

getProducts();