/*
  Warnings:

  - You are about to drop the column `userId` on the `Preferences` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[userPrefId]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userPrefId` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Preferences" DROP CONSTRAINT "Preferences_userId_fkey";

-- DropIndex
DROP INDEX "Preferences_userId_key";

-- AlterTable
ALTER TABLE "Preferences" DROP COLUMN "userId";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "userPrefId" TEXT NOT NULL,
ALTER COLUMN "role" SET DEFAULT 'BASIC';

-- CreateIndex
CREATE UNIQUE INDEX "User_userPrefId_key" ON "User"("userPrefId");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_userPrefId_fkey" FOREIGN KEY ("userPrefId") REFERENCES "Preferences"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
