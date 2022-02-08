//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import './CourseManager.sol';

contract UserManager is CourseManager {

    CourseManager coursemanager;

    struct Person {
        uint256[] courseIds;
    }


    function signUp() public {}
    function courseRegister(uint256 _courseId) public payable {
        require(msg.value >= allCourses[_courseId].price, 'Did not send enough to buy the course');

        allCourses[_courseId].users.push(msg.sender);

    }
    function withdraw() public {}
    function getCourses() public {}
    function getUSer() public {}
    
}