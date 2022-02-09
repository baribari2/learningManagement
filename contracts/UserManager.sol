//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import './CourseManager.sol';

contract UserManager is CourseManager {
    uint256 public userIds = 1;
    uint256 public totalUsers;
    CourseManager coursemanager;

    mapping (uint256 => Person) allUsers;
    address[] private userKeys;

    struct Person {
        uint256 userId;
        string name;
        address userAddress;
        uint256[] courseIds;
    }
    Person public person;


    function signUp( string memory _name, address _userAddress) external {
        for (uint256 i = 0; i <= userKeys.length - 1; i++) {
            require (userKeys[i] != _userAddress, 'A user had already been created with this address');
        }

        person.userId = userIds;
        person.name = _name;
        person.userAddress = _userAddress;
        allUsers[userIds] = person;

        userKeys.push(_userAddress);

        userIds++;
        totalUsers++;

    }

    function courseRegister(uint256 _courseId, address _registrationAddress) public payable {
        require(msg.value >= allCourses[_courseId].price, 'Did not send enough to buy the course');
        course.users.push();
        allCourses[_courseId].users.push(_registrationAddress);

    }
    function withdraw() public {}
    function getCourses() public {}
    function getUser(uint256 _userId) public view returns(address) {
        return(allUsers[_userId].userAddress);
    }
    
}