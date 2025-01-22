import mongoose, { Document, Model, Schema } from "mongoose";

const { ObjectId } = mongoose.Schema;

interface IUser extends Document {
    name: string;
    email: string;
    password: string;
    verified: boolean;
    isAdmin: boolean;
    stripeCustomerId?: string;
}

const userSchema: Schema = new Schema(
    {
        name: {
            type: String,
            required: true,
            unique: true,
            minLength: 3,
        },
        email: {
            type: String,
            required: true,
            unique: true,
        },
        password: {
            type: String,
            required: true,
            unique: true,
            minLength: 3,
        },
        verified: {
            type: Boolean,
            default: false,
        },
        isAdmin: {
            type: Boolean,
            default: false,
        },
        stripeCustomerId: {
            type: String,
        },
    },
    { timestamps: true }
);

const User: Model<IUser> = mongoose.model<IUser>("User", userSchema);
export default User;
