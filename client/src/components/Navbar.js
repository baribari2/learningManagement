import React from 'react';
import './Navbar.css';

import { useState } from 'react';

function Navbar() {

    const [searchInput, setSearchInput] = useState('');

    function handleSignUpClick(e) {
        e.preventDefault();

        console.log('Click works')
    }

    function handleSearchClick(e) {
        e.preventDefault();

        console.log(searchInput)
    }

    return(
        <div>
            <div className='nav-container'>
                <div className='nav-header'>Course Management System</div>
                <div className='search-container'>
                    <form className='search-bar' onChange={e => setSearchInput({ searchInput: e.target.value})}>
                        <input className='search-input'  placeholder='Search'/>
                        <button className='search-submit' type='submit' onClick={handleSearchClick}>Search</button>
                    </form>
                </div>
                <button className='sign-up-button' onClick={handleSignUpClick}>Sign Up</button>
            </div>
        </div>
    );
}

export default Navbar;
