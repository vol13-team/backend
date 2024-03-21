import { Organization } from "@prisma/client";
import { PrismaService } from "src/prisma/prisma.service";

export class AppService {
  constructor(private readonly prismaService: PrismaService) {}

  async fetchAllOrganization(): Promise<Organization[] | null> {
    const organizations = await this.prismaService.organization.findMany();
    return organizations;
  }

  async fetchOrganizationById(id: string): Promise<Organization | null> {
    const organization = await this.prismaService.organization.findUnique({
      where: { OrganizationID: id },
    });
    return organization;
  }

  async createOrganization(
    OrganizationName: string,
    Description: string,
    Authority: string,
    userID: string
  ): Promise<Organization> {
    const organization = await this.prismaService.organization.create({
      data: {
        OrganizationName: OrganizationName,
        Description: Description,
        Authority: Authority,
        UserID: userID,
      },
    });
    return organization;
  }

  async updateOrganization(
    id: string,
    OrganizationName: string,
    Description: string,
    Authority: string
  ): Promise<Organization> {
    const organization = await this.prismaService.organization.update({
      where: { OrganizationID: id },
      data: {
        OrganizationName: OrganizationName,
        Description: Description,
        Authority: Authority,
      },
    });
    return organization;
  }

  async deleteOrganization(id: string): Promise<Organization> {
    const organization = await this.prismaService.organization.delete({
      where: { OrganizationID: id },
    });
    return organization;
  }
}
