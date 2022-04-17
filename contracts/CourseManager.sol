//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract CourseManager {

    uint256 public totalCourses; // counter
    uint256 public courseIds = 1;
    address public owner; // contract owner
    address private feeCollectorAddress; // address that fees are sent to

    mapping(uint256 => Course) public allCourses;
    uint256[] public courseKeys;

    enum Categories {
        Development,
        Business,
        Blockchain,
        Design,
        Writing,
        Fitness,
        Productivity
    }

    // Have to figure out whether to use arweave or IPFS for storing course content
    struct Course {
        uint256 courseHash;
        uint256 courseId;
        string name;
        uint128 price;
        address owner;
        mapping (uint256 => bool) isRegistered;
        address[] users; //user addresses
        string courseBaseURI;
        uint256[] courseIPFSId;
        Categories categories;

    }
    Course public course;

    constructor() {
        owner == msg.sender;
    }

    modifier onlyOwner() {
        require (msg.sender == owner);
        _;
    }

    /// @notice Function that creates courses, it takes in the baseURI and Id's and sets the URI
    /// @dev I thought about automating setting IPFSId, but then realized that courses shouldn't be that long to
    /// where users cant input them all manually. i.e. it'd be hard to manually input 10,000 tokenIds if this was an NFT project
    /// but no course should have 10,000 lessons
    ///@dev add keccack256 function to compare strings
    /// @dev Have to figure out how to concat strings
    function addCourse(
        string memory _name,
        uint128 _price,
        string memory _courseBaseURI,
        uint256[] memory _courseIPFSId
    ) public {
        for (uint256 i = 0; i < courseKeys.length; i++) {
            require(
                keccak256(abi.encode(allCourses[courseKeys[i]].name)) != keccak256(abi.encode(_name)),
                'There is already a course with that name'
            );
        }

        course.courseId = courseIds;
        course.name = _name;
        course.price = _price;
        course.owner = msg.sender;
       // allCourses[courseIds] = course;

        courseKeys.push(courseIds);

        totalCourses++;
        courseIds++;

        // string[] memory uintToStringArray;
        // for (uint256 i = 0; i < _courseIPFSId.length; i++){
        //     uintToStringArray[i] = Strings.toString(_courseIPFSId[i]);
        // }
        // for (uint256 i = 0; i < uintToStringArray.length; i++) {
        //     allCourses[course.courseId].courseURIs[i] = appendUintToString(_courseBaseURI, uintToStringArray[i]);
        // }

    }

    function getCourse(uint256 _courseId)
    public
    view
     returns(
         uint256,
         string memory,
         address
        ) {
        return(
            allCourses[_courseId].courseId, 
            allCourses[_courseId].name, 
            allCourses[_courseId].owner
        );
    }

}
