/*
  Warnings:

  - The primary key for the `Answer` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Article` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `ArticleTag` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Issue` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `IssueTag` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Option` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Organisation` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Tag` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Update_at` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `User` table. All the data in the column will be lost.
  - The primary key for the `UserTag` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "Answer" DROP CONSTRAINT "Answer_AnserUserID_fkey";

-- DropForeignKey
ALTER TABLE "Answer" DROP CONSTRAINT "Answer_IssueID_fkey";

-- DropForeignKey
ALTER TABLE "Article" DROP CONSTRAINT "Article_ArticleUserName_fkey";

-- DropForeignKey
ALTER TABLE "ArticleTag" DROP CONSTRAINT "ArticleTag_ArticleID_fkey";

-- DropForeignKey
ALTER TABLE "ArticleTag" DROP CONSTRAINT "ArticleTag_TagID_fkey";

-- DropForeignKey
ALTER TABLE "Issue" DROP CONSTRAINT "Issue_OptionID_fkey";

-- DropForeignKey
ALTER TABLE "IssueTag" DROP CONSTRAINT "IssueTag_IssueID_fkey";

-- DropForeignKey
ALTER TABLE "IssueTag" DROP CONSTRAINT "IssueTag_TagID_fkey";

-- DropForeignKey
ALTER TABLE "Organisation" DROP CONSTRAINT "Organisation_ArticleID_fkey";

-- DropForeignKey
ALTER TABLE "Organisation" DROP CONSTRAINT "Organisation_IssueID_fkey";

-- DropForeignKey
ALTER TABLE "Organisation" DROP CONSTRAINT "Organisation_UserID_fkey";

-- DropForeignKey
ALTER TABLE "UserTag" DROP CONSTRAINT "UserTag_TagID_fkey";

-- DropForeignKey
ALTER TABLE "UserTag" DROP CONSTRAINT "UserTag_UserID_fkey";

-- AlterTable
ALTER TABLE "Answer" DROP CONSTRAINT "Answer_pkey",
ALTER COLUMN "AnswerID" SET DATA TYPE TEXT,
ALTER COLUMN "IssueID" SET DATA TYPE TEXT,
ALTER COLUMN "AnserUserID" SET DATA TYPE TEXT,
ALTER COLUMN "selectOptionID" SET DATA TYPE TEXT,
ADD CONSTRAINT "Answer_pkey" PRIMARY KEY ("AnswerID");

-- AlterTable
ALTER TABLE "Article" DROP CONSTRAINT "Article_pkey",
ALTER COLUMN "ArticleID" SET DATA TYPE TEXT,
ALTER COLUMN "ArticleUserName" SET DATA TYPE TEXT,
ADD CONSTRAINT "Article_pkey" PRIMARY KEY ("ArticleID");

-- AlterTable
ALTER TABLE "ArticleTag" DROP CONSTRAINT "ArticleTag_pkey",
ALTER COLUMN "ArticleTagID" SET DATA TYPE TEXT,
ALTER COLUMN "ArticleID" SET DATA TYPE TEXT,
ALTER COLUMN "TagID" SET DATA TYPE TEXT,
ADD CONSTRAINT "ArticleTag_pkey" PRIMARY KEY ("ArticleTagID");

-- AlterTable
ALTER TABLE "Issue" DROP CONSTRAINT "Issue_pkey",
ALTER COLUMN "IssueID" SET DATA TYPE TEXT,
ALTER COLUMN "PostUserID" SET DATA TYPE TEXT,
ALTER COLUMN "OrganisationID" SET DATA TYPE TEXT,
ALTER COLUMN "OptionID" SET DATA TYPE TEXT,
ADD CONSTRAINT "Issue_pkey" PRIMARY KEY ("IssueID");

-- AlterTable
ALTER TABLE "IssueTag" DROP CONSTRAINT "IssueTag_pkey",
ALTER COLUMN "IssueTagID" SET DATA TYPE TEXT,
ALTER COLUMN "IssueID" SET DATA TYPE TEXT,
ALTER COLUMN "TagID" SET DATA TYPE TEXT,
ADD CONSTRAINT "IssueTag_pkey" PRIMARY KEY ("IssueTagID");

-- AlterTable
ALTER TABLE "Option" DROP CONSTRAINT "Option_pkey",
ALTER COLUMN "OptionID" SET DATA TYPE TEXT,
ADD CONSTRAINT "Option_pkey" PRIMARY KEY ("OptionID");

-- AlterTable
ALTER TABLE "Organisation" DROP CONSTRAINT "Organisation_pkey",
ALTER COLUMN "OrganisationID" SET DATA TYPE TEXT,
ALTER COLUMN "UserID" SET DATA TYPE TEXT,
ALTER COLUMN "ArticleID" SET DATA TYPE TEXT,
ALTER COLUMN "IssueID" SET DATA TYPE TEXT,
ADD CONSTRAINT "Organisation_pkey" PRIMARY KEY ("OrganisationID");

-- AlterTable
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_pkey",
ALTER COLUMN "TagID" SET DATA TYPE TEXT,
ADD CONSTRAINT "Tag_pkey" PRIMARY KEY ("TagID");

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
DROP COLUMN "Update_at",
DROP COLUMN "created_at",
ALTER COLUMN "UserID" SET DATA TYPE TEXT,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("UserID");

-- AlterTable
ALTER TABLE "UserTag" DROP CONSTRAINT "UserTag_pkey",
ALTER COLUMN "UserTagID" SET DATA TYPE TEXT,
ALTER COLUMN "UserID" SET DATA TYPE TEXT,
ALTER COLUMN "TagID" SET DATA TYPE TEXT,
ADD CONSTRAINT "UserTag_pkey" PRIMARY KEY ("UserTagID");

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
