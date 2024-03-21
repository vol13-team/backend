/*
  Warnings:

  - You are about to drop the column `OrganisationID` on the `Issue` table. All the data in the column will be lost.
  - You are about to drop the `Organisation` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Issue" DROP CONSTRAINT "Issue_OrganisationID_fkey";

-- DropForeignKey
ALTER TABLE "Organisation" DROP CONSTRAINT "Organisation_ArticleID_fkey";

-- DropForeignKey
ALTER TABLE "Organisation" DROP CONSTRAINT "Organisation_UserID_fkey";

-- AlterTable
ALTER TABLE "Issue" DROP COLUMN "OrganisationID",
ADD COLUMN     "OrganizationID" TEXT;

-- DropTable
DROP TABLE "Organisation";

-- CreateTable
CREATE TABLE "Organization" (
    "OrganizationID" TEXT NOT NULL,
    "OrganizationName" TEXT NOT NULL,
    "discruption" TEXT NOT NULL,
    "authority" TEXT NOT NULL,
    "UserID" TEXT,
    "ArticleID" TEXT,

    CONSTRAINT "Organization_pkey" PRIMARY KEY ("OrganizationID")
);

-- AddForeignKey
ALTER TABLE "Issue" ADD CONSTRAINT "Issue_OrganizationID_fkey" FOREIGN KEY ("OrganizationID") REFERENCES "Organization"("OrganizationID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organization" ADD CONSTRAINT "Organization_UserID_fkey" FOREIGN KEY ("UserID") REFERENCES "User"("UserID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organization" ADD CONSTRAINT "Organization_ArticleID_fkey" FOREIGN KEY ("ArticleID") REFERENCES "Article"("ArticleID") ON DELETE SET NULL ON UPDATE CASCADE;
