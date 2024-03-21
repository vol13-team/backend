/*
  Warnings:

  - You are about to drop the column `AnserUserID` on the `Answer` table. All the data in the column will be lost.
  - Added the required column `AnswerUserID` to the `Answer` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Answer" DROP CONSTRAINT "Answer_AnserUserID_fkey";

-- AlterTable
ALTER TABLE "Answer" DROP COLUMN "AnserUserID",
ADD COLUMN     "AnswerUserID" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "Answer" ADD CONSTRAINT "Answer_AnswerUserID_fkey" FOREIGN KEY ("AnswerUserID") REFERENCES "User"("UserID") ON DELETE RESTRICT ON UPDATE CASCADE;
