import { Article } from "@prisma/client";
import { PrismaService } from "src/prisma/prisma.service";

export class AppService {
  constructor(private readonly prismaService: PrismaService) {}

  async fetchAllArticle(): Promise<Article[]> {
    const articles = await this.prismaService.article.findMany();
    return articles;
  }

  async fetchArticleById(id: string): Promise<Article> {
    const article = await this.prismaService.article.findUnique({ where: { ArticleID: id } });
    return article;
  }
  async createArticle(title: string, link: string, user_name: string): Promise<Article> {
    const article = await this.prismaService.article.create({
      data: { ArticleTitle: title, ArticleLink: link, ArticleUserName: user_name },
    });
    return article;
  }

  async updateArticle(
    id: string,
    title: string,
    link: string,
    user_name: string
  ): Promise<Article> {
    const article = await this.prismaService.article.update({
      where: { ArticleID: id },
      data: {
        ArticleTitle: title,
        ArticleLink: link,
        ArticleUserName: user_name,
      },
    });
    return article;
  }

  async deleteArticle(id: string): Promise<Article> {
    const article = await this.prismaService.article.delete({ where: { ArticleID: id } });
    return article;
  }
}
