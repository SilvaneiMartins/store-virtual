import bcrypt from "bcrypt";
import { Request, Response } from "express";

import User from "../models/user";
import { validationEmail, validateLength } from "../utils/validation";

export const register = async (req: Request, res: Response): Promise<void> => {
    try {
        const { name, email, password } = req.body;

        if (!validationEmail(email)) {
            res.status(400).json({
                message: "Endereço Eletrônico inválido!",
            });
            return;
        }

        const existingEmail = await User.findOne({
            email,
        });

        if (existingEmail) {
            res.status(400).json({
                message: "Endereço Eletrônico ja cadastrado!",
            });
            return;
        }

        const existingName = await User.findOne({
            name,
        });

        if (existingName) {
            res.status(400).json({
                message: "Nome de usuário ja cadastrado!",
            });
            return;
        }

        if (!validateLength(name, 3, 25)) {
            res.status(400).json({
                message: "Nome de usuário deve ter entre 3 e 25 caracteres!",
            });
            return;
        }

        const hashedPassword = await bcrypt.hash(password, 8);

        const user = new User({
            name,
            email,
            password: hashedPassword,
        });

        await user.save();

        res.status(201).json({
            message: "Usuário cadastrado com sucesso!",
        });

        return;
    } catch (error) {
        const statusCode = (error as any).statusCode || 500;
        const message = (error as any).message || "Erro de servidor!";

        res.status(statusCode).json({
            message,
        });

        return;
    }
};
