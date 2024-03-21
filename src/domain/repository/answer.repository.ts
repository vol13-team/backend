import { Answer } from "@prisma/client";
import { PrismaService } from "src/prisma/prisma.service";

export class AppService {
  constructor(private readonly prismaService: PrismaService) {}

  async fetchAllAnswer(): Promise<Answer[]> {
    const answers = await this.prismaService.answer.findMany();
    return answers;
  }
  async fetchAnswerById(id: string): Promise<Answer> {
    const answer = await this.prismaService.answer.findUnique({ where: { AnswerID: id } });
    return answer;
  }
  async createAnswer(
    Decision: boolean,
    IssueID: string,
    AnswerUserID: string,
    SelectOptionID: string
  ): Promise<Answer> {
    const answer = await this.prismaService.answer.create({
      data: {
        Decision: Decision,
        IssueID: IssueID,
        AnswerUserID: AnswerUserID,
        SelectOptionID: SelectOptionID,
      },
    });
    return answer;
  }
  async updateAnswer(
    id: string,
    decision: boolean,
    issueID: string,
    answerUserID: string,
    selectOptionID: string
  ): Promise<Answer> {
    const answer = await this.prismaService.answer.update({
      where: { AnswerID: id },
      data: {
        Decision: decision,
        IssueID: issueID,
        AnswerUserID: answerUserID,
        SelectOptionID: selectOptionID,
      },
    });
    return answer;
  }

  async deleteAnswer(id: string): Promise<Answer> {
    const answer = await this.prismaService.answer.delete({ where: { AnswerID: id } });
    return answer;
  }
}
