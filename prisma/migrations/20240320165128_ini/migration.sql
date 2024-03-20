/*
  Warnings:

  - Made the column `ArticleLink` on table `Article` required. This step will fail if there are existing NULL values in that column.
  - Changed the type of `ArticleUserName` on the `Article` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `OptionID` to the `Issue` table without a default value. This is not possible if the table is not empty.
  - Made the column `IsuueDetail` on table `Issue` required. This step will fail if there are existing NULL values in that column.
  - Made the column `explanation` on table `Issue` required. This step will fail if there are existing NULL values in that column.
  - Made the column `Option1` on table `Option` required. This step will fail if there are existing NULL values in that column.
  - Made the column `Option2` on table `Option` required. This step will fail if there are existing NULL values in that column.
  - Made the column `Option3` on table `Option` required. This step will fail if there are existing NULL values in that column.
  - Made the column `Option4` on table `Option` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `IssueID` to the `Organisation` table without a default value. This is not possible if the table is not empty.
  - Made the column `discruption` on table `Organisation` required. This step will fail if there are existing NULL values in that column.
  - Made the column `authority` on table `Organisation` required. This step will fail if there are existing NULL values in that column.
  - Made the column `UserIcon` on table `User` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Article" ALTER COLUMN "ArticleLink" SET NOT NULL,
DROP COLUMN "ArticleUserName",
ADD COLUMN     "ArticleUserName" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Issue" ADD COLUMN     "OptionID" INTEGER NOT NULL,
ALTER COLUMN "IsuueDetail" SET NOT NULL,
ALTER COLUMN "explanation" SET NOT NULL;

-- AlterTable
ALTER TABLE "Option" ALTER COLUMN "Option1" SET NOT NULL,
ALTER COLUMN "Option2" SET NOT NULL,
ALTER COLUMN "Option3" SET NOT NULL,
ALTER COLUMN "Option4" SET NOT NULL;

-- AlterTable
ALTER TABLE "Organisation" ADD COLUMN     "IssueID" INTEGER NOT NULL,
ALTER COLUMN "discruption" SET NOT NULL,
ALTER COLUMN "authority" SET NOT NULL;

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "UserIcon" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "Issue" ADD CONSTRAINT "Issue_OptionID_fkey" FOREIGN KEY ("OptionID") REFERENCES "Option"("OptionID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Article" ADD CONSTRAINT "Article_ArticleUserName_fkey" FOREIGN KEY ("ArticleUserName") REFERENCES "User"("UserID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Answer" ADD CONSTRAINT "Answer_AnserUserID_fkey" FOREIGN KEY ("AnserUserID") REFERENCES "User"("UserID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Answer" ADD CONSTRAINT "Answer_IssueID_fkey" FOREIGN KEY ("IssueID") REFERENCES "Issue"("IssueID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organisation" ADD CONSTRAINT "Organisation_UserID_fkey" FOREIGN KEY ("UserID") REFERENCES "User"("UserID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organisation" ADD CONSTRAINT "Organisation_ArticleID_fkey" FOREIGN KEY ("ArticleID") REFERENCES "Article"("ArticleID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organisation" ADD CONSTRAINT "Organisation_IssueID_fkey" FOREIGN KEY ("IssueID") REFERENCES "Issue"("IssueID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserTag" ADD CONSTRAINT "UserTag_UserID_fkey" FOREIGN KEY ("UserID") REFERENCES "User"("UserID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserTag" ADD CONSTRAINT "UserTag_TagID_fkey" FOREIGN KEY ("TagID") REFERENCES "Tag"("TagID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArticleTag" ADD CONSTRAINT "ArticleTag_ArticleID_fkey" FOREIGN KEY ("ArticleID") REFERENCES "Article"("ArticleID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArticleTag" ADD CONSTRAINT "ArticleTag_TagID_fkey" FOREIGN KEY ("TagID") REFERENCES "Tag"("TagID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IssueTag" ADD CONSTRAINT "IssueTag_IssueID_fkey" FOREIGN KEY ("IssueID") REFERENCES "Issue"("IssueID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IssueTag" ADD CONSTRAINT "IssueTag_TagID_fkey" FOREIGN KEY ("TagID") REFERENCES "Tag"("TagID") ON DELETE RESTRICT ON UPDATE CASCADE;
