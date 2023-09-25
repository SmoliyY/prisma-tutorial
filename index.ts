import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

console.log('localtunnel')

const main = async () => {
  await prisma.post.deleteMany();
  await prisma.user.deleteMany();
  const user = await prisma.user.create({
    data: {
      email: "yevhe2n@emai.com",
      name: "Yevhe2",
      role: "BASIC",
      writtenPosts: {
        create: {
          rating: 2,
          title: "title",
        },
      },
      userPref: {
        create: {
          sendNotification: true,
        },
      },
    },
    include: {
      writtenPosts: true,
      userPref: {
        select: {
          sendNotification: true,
        },
      },
    },
  });

  console.log(user);
};

main()
  .catch((e) => {
    console.log(e);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
