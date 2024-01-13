import mssql from "mssql";

const connectionSettings = {
    server: "localhost",
    database: "prueba",
    user: "jocar",
    password: "12345",
    options: {
        encrypt: true,
        trustServerCertificate: true
    }
} 


export async function getConnection(){
    try {
        return await mssql.connect(connectionSettings);
    } catch (error) {
        console.log(error)
    }
}



export {mssql};