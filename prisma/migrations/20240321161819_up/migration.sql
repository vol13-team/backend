/*
  Warnings:

  - You are about to drop the column `selectOptionID` on the `Answer` table. All the data in the column will be lost.
  - You are about to drop the column `Update_at` on the `Issue` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `Issue` table. All the data in the column will be lost.
  - You are about to drop the column `explanation` on the `Issue` table. All the data in the column will be lost.
  - Added the required column `SelectOptionID` to the `Answer` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Explanation` to the `Issue` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Answer" DROP COLUMN "selectOptionID",
ADD COLUMN     "SelectOptionID" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Issue" DROP COLUMN "Update_at",
DROP COLUMN "created_at",
DROP COLUMN "explanation",
ADD COLUMN     "Explanation" TEXT NOT NULL,
ALTER COLUMN "OrganisationID" DROP NOT NULL;
