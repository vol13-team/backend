import { Tag } from "@prisma/client";
import { PrismaService } from "src/prisma/prisma.service";

export class AppService {
  constructor(private readonly prismaService: PrismaService) {}

  async fetchAllTag(): Promise<Tag[]> {
    const tags = await this.prismaService.tag.findMany();
    return tags;
  }
  async fetchTagById(id: string): Promise<Tag> {
    const tag = await this.prismaService.tag.findUnique({ where: { TagID: id } });
    return tag;
  }
  async createTag(name: string): Promise<Tag> {
    const tag = await this.prismaService.tag.create({ data: { TagName: name } });
    return tag;
  }

  async updateTag(id: string, name: string): Promise<Tag> {
    const tag = await this.prismaService.tag.update({
      where: { TagID: id },
      data: { TagName: name },
    });
    return tag;
  }
  async deleteTag(id: string): Promise<Tag> {
    const tag = await this.prismaService.tag.delete({ where: { TagID: id } });
    return tag;
  }
}
