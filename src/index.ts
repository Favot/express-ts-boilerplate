import express, { Request, Response } from "express";
import { userRouter } from "./routes/user";

const app = express();
const PORT = 3000;
console.log(process.env.DATABASE_URL);
app.get("/", (_req: Request, res: Response) => {
  res.send("Hello, TypeScript with Express!");
});

app.use("/user", userRouter);

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
