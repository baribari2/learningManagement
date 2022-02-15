const hre = require("hardhat");

async function main() {

  const CourseMan = await hre.ethers.getContractFactory("CourseManager");
  const courseman = await CourseMan.deploy();

  const UserMan = await hre.ethers.getContractFactory("UserManager");
  const userman = await UserMan.deploy();

  await courseman.deployed();
  await userman.deployed();

  console.log("CourseMan deployed to:", courseman.address);
  console.log("UserMan deployed to:", userman.address);
}
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
