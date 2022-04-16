import {useState, react } from 'react'
import ReactDOM from 'react-dom'
import { MdMenu } from "react-icons/md"
import { IconContext } from "react-icons"
import { ethers } from 'ethers'

import {
    NavbarContainer,
    LogoContainer,
    MobileMenu,
    AddCourse,
    MobileMenuButton
} from './NavbarStyled'

function Navbar() {

    const [activeSidebar, setActiveSidebar] = useState(false)

    const sidebarClick = (e) => {
        e.preventDefault()
        setActiveSidebar( !activeSidebar )
        console.log( activeSidebar )
    }

  return (
    <NavbarContainer>
        <LogoContainer>
            ChainNerd
        </LogoContainer>
        <MobileMenu>
            <MobileMenuButton>
                <MdMenu 
                    color= 'white'
                    size='25px'
                    onClick={ sidebarClick }
                />
            </MobileMenuButton>
            {/* <AddCourse onClick={ sidebarClick }>
                AddCourse
            </AddCourse> */}
        </MobileMenu>
    </NavbarContainer>
  )
}

export default Navbar