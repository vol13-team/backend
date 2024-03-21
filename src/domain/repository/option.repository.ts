import { Option } from "@prisma/client";
import { PrismaService } from "src/prisma/prisma.service";

export class AppService {
  constructor(private readonly prismaService: PrismaService) {}

  async fetchAllOption(): Promise<Option[]> {
    const options = await this.prismaService.option.findMany();
    return options;
  }
  async fetchOptionById(id: string): Promise<Option> {
    const option = await this.prismaService.option.findUnique({ where: { OptionID: id } });
    return option;
  }
  async createOption(
    option1: string,
    option2: string,
    option3: string,
    option4: string,
    CorrectOption: number
  ): Promise<Option> {
    const option = await this.prismaService.option.create({
      data: {
        Option1: option1,
        Option2: option2,
        Option3: option3,
        Option4: option4,
        CorrectOption: CorrectOption,
      },
    });
    return option;
  }

  async updateOption(
    id: string,
    option1: string,
    option2: string,
    option3: string,
    option4: string,
    CorrectOption: number
  ): Promise<Option> {
    const option = await this.prismaService.option.update({
      where: { OptionID: id },
      data: {
        Option1: option1,
        Option2: option2,
        Option3: option3,
        Option4: option4,
        CorrectOption: CorrectOption,
      },
    });
    return option;
  }
  async deleteOption(id: string): Promise<Option> {
    const option = await this.prismaService.option.delete({ where: { OptionID: id } });
    return option;
  }
}
