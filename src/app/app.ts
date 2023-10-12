import express, { Request, Response } from 'express'
import { userRouter } from '../routes/user'

const app = express()

app.get('/', (_req: Request, res: Response) => {
  res.send('Hello, TypeScript with Express!')
})
app.use('/user', userRouter)

export { app }
