import React from 'react';
import { useState } from 'react';
import ReactDOM from 'react-dom';

import { ethers } from 'ethers';

import './AddCourse.css';
import CourseManager from '../artifacts/contracts/CourseManager.sol/CourseManager.json';
import UserManager from '../artifacts/contracts/UserManager.sol/UserManager.json';
function AddCourse() {

    const userABI = UserManager.abi;
    const userAddress = '0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512';
    const courseABI = CourseManager.abi;
    const courseAddress = '0x5FbDB2315678afecb367f032d93F642f64180aa3';

    const [nameInput, SetNameInput] = useState('');
    const [topicInput, SetTopicInput] = useState('');
    const [priceInput, SetPriceInput] = useState('');

    function connectUser(e){
        e.preventDefault() 

        console.log('It works');
    }
    
    async function handleSubmit(e) {
        e.preventDefault();
        if (typeof window.ethereum != 'undefined') {
            const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });

            const provider = new ethers.providers.Web3Provider(window.ethereum);
            const signer = provider.getSigner();
            const coursemanager = new ethers.Contract(courseAddress, courseABI, signer);

            const callPrice = ethers.utils.formatEther("700");
            console.log(callPrice);
            //const submitCourse = await coursemanager.addCourse(nameInput, topicInput, callPrice);
            //submitCourse.wait();
        }

        
        console.log( nameInput );
        console.log( topicInput );
        console.log( priceInput );
        
    }

    return(
        <div className='add-course-container' onSubmit={handleSubmit}>
            <label className='add-course-label'>ADD A COURSE</label>
            <div className='name-form-container'>
                <form className='name-form'>
                    <input className='name-input' placeholder='Name' type='text' onChange={ e => SetNameInput({ nameInput: e.target.value})}/>
                </form>
            </div>
            <div className='topic-form-container'>
                <form className='topic-form'>
                    <input className='topic-input' placeholder='Topic' type='text' onChange={ e => SetTopicInput({ topicInput: e.target.value})}/>
                </form>
            </div>
            <div className='price-form-container'>
                <form className='price-form'>
                    <input className='price-input' placeholder='Price' type='text' onChange={ e => SetPriceInput({ priceInput: e.target.value})}/>
                </form>
            </div>
        </div>
    )
}

export default AddCourse