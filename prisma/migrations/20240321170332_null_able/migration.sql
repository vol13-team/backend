-- DropForeignKey
ALTER TABLE "Issue" DROP CONSTRAINT "Issue_OptionID_fkey";

-- AlterTable
ALTER TABLE "Issue" ALTER COLUMN "OptionID" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Issue" ADD CONSTRAINT "Issue_OptionID_fkey" FOREIGN KEY ("OptionID") REFERENCES "Option"("OptionID") ON DELETE SET NULL ON UPDATE CASCADE;
