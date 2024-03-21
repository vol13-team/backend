import { Issue } from "@prisma/client";
import { PrismaService } from "src/prisma/prisma.service";

export class AppService {
  constructor(private readonly prismaService: PrismaService) {}

  async fetchAllIssue(): Promise<Issue[]> {
    const issues = await this.prismaService.issue.findMany();
    return issues;
  }
  async fetchIssueById(id: string): Promise<Issue> {
    const issue = await this.prismaService.issue.findUnique({ where: { IssueID: id } });
    return issue;
  }

  async createIssue(
    IssueName: string,
    IssueDetail: string,
    Visibility: boolean,
    PostUserID: string,
    explanation: string
  ): Promise<Issue> {
    const issue = await this.prismaService.issue.create({
      data: {
        IssueName: IssueName,
        IssueDetail: IssueDetail,
        Visibility: Visibility,
        PostUserID: PostUserID,
        Explanation: explanation,
        Option: null,
      },
    });
    return issue;
  }

  async updateIssue(
    id: string,
    IssueName: string,
    IssueDetail: string,
    Visibility: boolean,
    PostUserID: string,
    explanation: string
  ): Promise<Issue> {
    const issue = await this.prismaService.issue.update({
      where: { IssueID: id },
      data: {
        IssueName: IssueName,
        IssueDetail: IssueDetail,
        Visibility: Visibility,
        PostUserID: PostUserID,
        Explanation: explanation,
      },
    });
    return issue;
  }

  async deleteIssue(id: string): Promise<Issue> {
    const issue = await this.prismaService.issue.delete({ where: { IssueID: id } });
    return issue;
  }
}
