import express from "express";
import prisma from "../prismaClient";

export const getUsers = async (
  _req: express.Request,
  res: express.Response
) => {
  try {
    const users = await prisma.user.findMany();
    res.json(users);
  } catch (error) {
    console.log("🚀 ~ file: user.ts:12 ~ error:", error);
    res.status(500).json({ error: "Failed to retrieve users" });
  }
};

interface GetUserByIdRequest extends express.Request {
  params: {
    id: string;
  };
}

export const getUserById = async (
  req: GetUserByIdRequest,
  res: express.Response
) => {
  try {
    const { id } = req.params;
    const user = await prisma.user.findUnique({
      where: {
        id: Number(id),
      },
    });
    res.json(user);
  } catch (error) {
    res.status(500).json({ error: "Failed to retrieve user" });
  }
};

interface UpdateUserRequest extends express.Request {
  params: {
    id: string;
  };
  body: {
    name: string;
    email: string;
  };
}

export const createUser = async (
  req: UpdateUserRequest,
  res: express.Response
) => {
  try {
    const { name, email } = req.body;
    const user = await prisma.user.create({
      data: {
        name,
        email,
      },
    });
    res.json(user);
  } catch (error) {
    res.status(500).json({ error: "Failed to create user" });
  }
};

interface UpdateUserRequest extends express.Request {
  params: {
    id: string;
  };
  body: {
    name: string;
    email: string;
  };
}

export const updateUser = async (
  req: UpdateUserRequest,
  res: express.Response
) => {
  try {
    const { id } = req.params;
    const { name, email } = req.body;
    const user = await prisma.user.update({
      where: {
        id: Number(id),
      },
      data: {
        name,
        email,
      },
    });
    res.json(user);
  } catch (error) {
    res.status(500).json({ error: "Failed to update user" });
  }
};

interface DeleteUserRequest extends express.Request {
  params: {
    id: string;
  };
}

export const deleteUser = async (
  req: DeleteUserRequest,
  res: express.Response
) => {
  try {
    const { id } = req.params;
    const user = await prisma.user.delete({
      where: {
        id: Number(id),
      },
    });
    res.json(user);
  } catch (error) {
    res.status(500).json({ error: "Failed to delete user" });
  }
};
