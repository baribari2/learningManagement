import './App.css';
import Navbar from './components/Navbar';

import AddCourse from './components/AddCourse';
import NewCourses from './components/NewCourses';

function App() {
  return (
    <div className="App">
      <Navbar />
      <AddCourse />
      <NewCourses />
    </div>
  );
}

export default App;
