//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import './CourseManager.sol';

/// @title UserManager is the contract that deals with all of the user logic, signing up for the site, registering, etc.
/// @author Jabari B.
contract UserManager is CourseManager {
    /// @notice Id that is assigned to a user on sign up
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

    event NewUser( string _name, address _userAddress);
    event RegisteredForCourse(uint256 _courseId, address _registrationAddress);
    event WithdrewFromCourse();


    /// @notice This function is for signing up, pretty self-explanatory
    /// @param _name is the name of the user that is signing up
    /// @param _userAddress is the address of the user that is signing up
    function signUp(string memory _name, address _userAddress) external {
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

        emit NewUser(_name, _userAddress);
    }

    /// @notice This is the function that adds a user to a course
    /// @param _courseId is how courses are referenced throughout the contracts
    /// @param _registrationAddress is the address of the user that is registering
    /// @param _userId Similar to `_courseId` userId's are users are refrenced throughout the contracts
    /// @dev Decided not to use `msg.sender` because I dont want a contract to be able to register
    function courseRegister(
        uint256 _courseId,
        address _registrationAddress,
        uint256 _userId
    )
        public
        payable {
            require(msg.value >= allCourses[_courseId].price, 'Did not send enough to buy the course');
            require(allCourses[_courseId].isRegistered[_userId] != true, 'User is already registered to this course');

            allUsers[_userId].courseIds.push(_courseId);
            allCourses[_courseId].isRegistered[_courseId] = true;

            emit RegisteredForCourse(_courseId, _registrationAddress);
    }

    function withdraw(uint256 _userId, uint256 _courseId) public {
        allCourses[_courseId].isRegistered[_userId] = false;

    }

    function getUser(uint256 _userId) public view returns(address) {
        return(allUsers[_userId].userAddress);
    }
}