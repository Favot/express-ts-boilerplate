import express from 'express'
import {
  createUser,
  deleteUser,
  fetchAllUsers,
  fetchUserById,
  updateUser
} from '../services/userService'

export const getUsers = async (
  _req: express.Request,
  res: express.Response
) => {
  try {
    const users = fetchAllUsers()
    res.json(users)
  } catch (error) {
    res.status(500).json({ error: 'Failed to retrieve users' })
  }
}

interface GetUserByIdRequest extends express.Request {
  params: {
    id: string
  }
}

export const getUserById = async (
  req: GetUserByIdRequest,
  res: express.Response
) => {
  try {
    const { id } = req.params
    const user = await fetchUserById(id)
    res.json(user)
  } catch (error) {
    res.status(500).json({ error: 'Failed to retrieve user' })
  }
}

interface CreateUserRequest extends express.Request {
  body: {
    name: string
    email: string
  }
}

export const createUserController = async (
  req: CreateUserRequest,
  res: express.Response
) => {
  try {
    const { name, email } = req.body
    const user = createUser({ userData: { name, email } })
    res.json(user)
  } catch (error) {
    res.status(500).json({ error: 'Failed to create user' })
  }
}

interface UpdateUserRequest extends express.Request {
  params: {
    id: string
  }
  body: {
    name: string
    email: string
  }
}

export const updateUserController = async (
  req: UpdateUserRequest,
  res: express.Response
) => {
  try {
    const { id } = req.params
    const { name, email } = req.body

    const user = updateUser({ userData: { id, name, email } })
    res.json(user)
  } catch (error) {
    res.status(500).json({ error: 'Failed to update user' })
  }
}

interface DeleteUserRequest extends express.Request {
  params: {
    id: string
  }
}

export const deleteUserController = async (
  req: DeleteUserRequest,
  res: express.Response
) => {
  try {
    const { id } = req.params
    const user = deleteUser({ id })
    res.json(user)
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete user' })
  }
}
