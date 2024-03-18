import { Injectable } from "@nestjs/common";
import { PrismaService } from "src/prisma/prisma.service";
import { CreateUserDto } from "src/interface/dto/user.dto";
@Injectable()
export class AppService {
  constructor(private readonly prismaService: PrismaService) {}

  async finedAll() {
    return this.prismaService.user.findMany();
  }

  async create(data: CreateUserDto) {
    return this.prismaService.user.create({
      data: {
        UserName: data.UserName,
        UserIcon: data.UserIcon,
      },
    });
  }
  async update(id: string, data: CreateUserDto) {
    return this.prismaService.user.update({
      where: { UserID: id },
      data: {
        UserName: data.UserName,
        UserIcon: data.UserIcon,
      },
    });
  }
  async delete(id: string) {
    return this.prismaService.user.delete({
      where: { UserID: id },
    });
  }
}
