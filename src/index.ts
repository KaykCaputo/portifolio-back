import express from 'express'
import { Router, Request, Response } from 'express';

import UserController from "./users/controller";

const app = express();

const route = Router()

app.use(express.json())

route.get('/', (req: Request, res: Response) => {
  res.json({ message: 'hello world with Typescript' })
})

route.get("/user", UserController.getUser)

app.use(route)


app.listen(3000, () => 'server running on port 3333')