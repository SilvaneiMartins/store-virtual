import cors from "cors";
import dotenv from "dotenv";
import express from "express";
import mongoose from "mongoose";

import useRouter from "./src/routes/user";

dotenv.config();

const app = express();
const port = process.env.PORT || 4000;
const MONGO_URI = process.env.DATABASE_URL;

if (!MONGO_URI) {
    throw new Error(
        "🔴 O URI do banco de dados não está definido nas variáveis ​​de ambiente."
    );
}

mongoose
    .connect(MONGO_URI)
    .then(() => {
        console.log("🟢 Banco de dados conectado com sucesso.");
    })
    .catch((error) => {
        console.log("🔴 Erro ao conectar ao banco de dados", error);
    });

app.use(cors());
app.use(express.json());
app.use(useRouter);

app.get("/", (req, res) => {
    res.send("🛍️ ILoja Virtual!");
});

app.listen(port, () => {
    console.log(`🟢 Servidor rodando na url http://localhost:${port}`);
});
