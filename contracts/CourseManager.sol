//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract CourseManager {
    uint256 public totalCourses;
    uint256 public courseIds = 1;
    address public owner;


    mapping(uint256 => Course) public allCourses;
    uint256[] public courseKeys;

    struct Course {
        uint256 courseId;
        string name;
        string topic;
        uint128 price;
        address owner;
        address[] users;
        //uint256 numReviews;

    }
    Course public course;

    constructor() {
        owner == msg.sender;
    }

    modifier onlyOwner() {
        require (msg.sender == owner);
        _;
    }

    ///@dev add keccack256 function to compare strings
    function addCourse(string memory _name, string memory _topic, uint128 _price) public {
        for (uint256 i = 0; i < courseKeys.length; i++) {
            //require(allCourses[courseKeys[i]].name != _name, 'There is already a course with that name');
        }

        course.courseId = courseIds;
        course.name = _name;
        course.topic = _topic;
        course.price = _price;
        course.owner = msg.sender;
        allCourses[courseIds] = course;

        courseKeys.push(courseIds);

        totalCourses++;
        courseIds++;

    }
    function getCourse(uint256 _courseId) public view returns(uint256, string memory, address) {
        return(allCourses[_courseId].courseId, allCourses[_courseId].name, allCourses[_courseId].owner);
    }
}
