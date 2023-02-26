import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

const main = async () => {

  await prisma.user.deleteMany()
        
//   const user = await prisma.user.create({
//     data: {
//         email: "yevhe2n@emai.com",
//         name: "Yevhe2",
//         role: 'BASIC',
//         writtenPosts: {
//             create: {
//                 rating: 2,
//                 title: 'title',

//             }
//         },
    
        
//     },
//     include: {
//         writtenPosts: true
//     }
//   })
}

main()
  .catch((e) => {
    console.log(e);
  })
  .finally(async() => {
    await prisma.$disconnect();
  });
