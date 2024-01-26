import express, { Request, Response } from "express";

const app = express();
app.use(express.static("dist"));
app.use(express.json());

app.get("/api/ping", (_req: Request, res: Response) => {
  res.send("pong");
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
