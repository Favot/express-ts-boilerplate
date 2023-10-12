import express from 'express'
import {
  createUserController,
  deleteUserController,
  getUserById,
  getUsers,
  updateUserController
} from '../controllers/user'

const userRouter = express.Router()

userRouter.get('/', getUsers)
userRouter.get('/:id', getUserById)
userRouter.post('/', createUserController)
userRouter.put('/:id', updateUserController)
userRouter.delete('/:id', deleteUserController)

export { userRouter }
