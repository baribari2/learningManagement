const hre = require("hardhat");

async function main() {

  const CourseMan = await hre.ethers.getContractFactory("CourseManager");
  const courseman = await CourseMan.deploy();

  await courseman.deployed();

  console.log("CourseMan deployed to:", courseman.address);
}
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
