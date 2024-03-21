import { User } from "@prisma/client";
import { PrismaService } from "src/prisma/prisma.service";

export class AppService {
  constructor(private readonly prismaService: PrismaService) {}

  async fetchAllUser(): Promise<User[]> {
    const users = await this.prismaService.user.findMany();
    return users;
  }
  async fetchUserById(id: string): Promise<User> {
    const user = await this.prismaService.user.findUnique({ where: { UserID: id } });
    return user;
  }
  async createUser(name: string, icon: string): Promise<User> {
    const user = await this.prismaService.user.create({ data: { UserName: name, UserIcon: icon } });
    return user;
  }

  async updateUser(id: string, name: string, icon: string): Promise<User> {
    const user = await this.prismaService.user.update({
      where: { UserID: id },
      data: { UserName: name, UserIcon: icon },
    });
    return user;
  }
  async deleteUser(id: string): Promise<User> {
    const user = await this.prismaService.user.delete({ where: { UserID: id } });
    return user;
  }
}
