import { PrismaClient, User } from '@prisma/client'

const prisma = new PrismaClient()

export const fetchAllUsers = async () => {
  try {
    return await prisma.user.findMany()
  } catch (error) {
    console.error('Error fetching all users:', error)
    throw new Error('Failed to retrieve users')
  }
}

export const fetchUserById = async (id: string): Promise<User> => {
  try {
    const user = await prisma.user.findUnique({
      where: { id: Number(id) }
    })

    if (user === null || user === undefined) {
      throw new Error('Failed to retrieve user')
    }

    return user
  } catch (error) {
    console.error('Error fetching user by ID:', error)
    throw new Error('Failed to retrieve user')
  }
}

interface CreateUser {
  name: string
  email: string
}

export const createUser = async ({ userData }: { userData: CreateUser }) => {
  try {
    return await prisma.user.create({
      data: userData
    })
  } catch (error) {
    console.error('Error creating user:', error)
    throw new Error('Failed to create user')
  }
}

interface UpdateUser {
  id: string
  name?: string
  email?: string
}

export const updateUser = async ({
  userData
}: {
  userData: UpdateUser
}): Promise<User> => {
  const { id, name, email } = userData
  try {
    const user = await fetchUserById(id)

    return await prisma.user.update({
      where: {
        id: Number(id)
      },
      data: {
        name: name ?? user.name,
        email: email ?? user.email
      }
    })
  } catch (error) {
    console.error('Error updating user:', error)
    throw new Error('Failed to update user')
  }
}

export const deleteUser = async ({
  id: userId
}: {
  id: string
}): Promise<User> => {
  try {
    return await prisma.user.delete({
      where: {
        id: Number(userId)
      }
    })
  } catch (error) {
    console.error('Error deleting user:', error)
    throw new Error('Failed to delete user')
  }
}
