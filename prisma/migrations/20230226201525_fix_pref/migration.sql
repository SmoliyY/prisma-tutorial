-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_userPrefId_fkey";

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "userPrefId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_userPrefId_fkey" FOREIGN KEY ("userPrefId") REFERENCES "Preferences"("id") ON DELETE SET NULL ON UPDATE CASCADE;
