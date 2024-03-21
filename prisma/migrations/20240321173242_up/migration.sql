/*
  Warnings:

  - You are about to drop the column `authority` on the `Organization` table. All the data in the column will be lost.
  - You are about to drop the column `discruption` on the `Organization` table. All the data in the column will be lost.
  - Added the required column `Authority` to the `Organization` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Description` to the `Organization` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Organization" DROP COLUMN "authority",
DROP COLUMN "discruption",
ADD COLUMN     "Authority" TEXT NOT NULL,
ADD COLUMN     "Description" TEXT NOT NULL;
