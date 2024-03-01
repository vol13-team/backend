import { Injectable } from '@nestjs/common';

@Injectable()
export class IssueRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findAll() {
    try {
      const issue_id = await this.prisma.issue.findMany();
      return issue_id;
    } catch (error) {
      throw error;
    }
  }
  async findOne(issueID: string) {
    try {
      const issue = await this.prisma.issue.findUnique({
        where: { issueID: issueID },
      });
      return issue;
    } catch (error) {
      throw error;
    }
  }
  async create(dto: CreateIssueDto) {
    try {
      const issue = await this.prisma.issue.create({
        data: {
          issue_id: dto.issue_id,
          issue_name: dto.issue_name,
          issue_detail: dto.issue_detail,
        },
      });
      return issue;
    } catch (error) {
      throw error;
    }
  }
  async update(issue_id: string, dto: UpdateIssueDto) {
    try {
      const user = await this.prisma.issue.update({
        where: { issue_id: issue_id },
        data: {
          issue_name: dto.issue_name,
          issue_detail: dto.issue_detail,
        },
      });
      return user;
    } catch (error) {
      throw error;
    }
  }
  async delete(user_id: string) {
    try {
      const user = await this.prisma.user.delete({
        where: { user_id: user_id },
      });
      return user;
    } catch (error) {
      throw error;
    }
  }
}
