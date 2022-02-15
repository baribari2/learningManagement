import React from 'react';
import { useState } from 'react';
import ReactDOM from 'react-dom';

import { ethers } from 'ethers';

import './AddCourse.css';

function AddCourse() {

    const [nameInput, SetNameInput] = useState('');
    const [topicInput, SetTopicInput] = useState('');
    const [priceInput, SetPriceInput] = useState('');

    function handleSubmit(e) {
        e.preventDefault();

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