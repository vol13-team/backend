/*
  Warnings:

  - You are about to drop the column `IssueID` on the `Organisation` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Organisation" DROP CONSTRAINT "Organisation_ArticleID_fkey";

-- DropForeignKey
ALTER TABLE "Organisation" DROP CONSTRAINT "Organisation_IssueID_fkey";

-- DropForeignKey
ALTER TABLE "Organisation" DROP CONSTRAINT "Organisation_UserID_fkey";

-- AlterTable
ALTER TABLE "Organisation" DROP COLUMN "IssueID",
ALTER COLUMN "UserID" DROP NOT NULL,
ALTER COLUMN "ArticleID" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Issue" ADD CONSTRAINT "Issue_OrganisationID_fkey" FOREIGN KEY ("OrganisationID") REFERENCES "Organisation"("OrganisationID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organisation" ADD CONSTRAINT "Organisation_UserID_fkey" FOREIGN KEY ("UserID") REFERENCES "User"("UserID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organisation" ADD CONSTRAINT "Organisation_ArticleID_fkey" FOREIGN KEY ("ArticleID") REFERENCES "Article"("ArticleID") ON DELETE SET NULL ON UPDATE CASCADE;
