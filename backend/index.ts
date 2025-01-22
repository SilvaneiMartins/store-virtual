import dotenv from "dotenv";
import express from "express";

dotenv.config();

const app = express();
const port = process.env.PORT || 4000;

app.get("/", (req, res) => {
    res.send("Loja Virtual!");
});

app.listen(port, () => {
    console.log(`🚀 Servidor rodando na url http://localhost:${port}`);
});
