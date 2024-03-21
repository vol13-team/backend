/*
  Warnings:

  - You are about to drop the column `IsuueDetail` on the `Issue` table. All the data in the column will be lost.
  - Added the required column `IssueDetail` to the `Issue` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Issue" DROP COLUMN "IsuueDetail",
ADD COLUMN     "IssueDetail" TEXT NOT NULL;
