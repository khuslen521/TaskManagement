// pages/index.js
import { useState } from 'react';

const TaskManager = () => {
  const [taskInput, setTaskInput] = useState('');
  const [tasks, setTasks] = useState([]);

  const handleTaskInputChange = (e) => {
    setTaskInput(e.target.value);
  };

  const handleAddTask = () => {
    if (taskInput.trim() !== '') {
      setTasks([...tasks, { id: Date.now(), text: taskInput, completed: false }]);
      setTaskInput('');
    }
  };

  const handleTaskCompletion = (taskId) => {
    setTasks(tasks.map((task) => {
      if (task.id === taskId) {
        return { ...task, completed: !task.completed };
      }
      return task;
    }));
  };

  const handleDeleteTask = (taskId) => {
    setTasks(tasks.filter((task) => task.id !== taskId));
  };

  return (
    <div>
      <h1>Task Manager</h1>
      <input
        type="text"
        placeholder="Enter task"
        value={taskInput}
        onChange={handleTaskInputChange}
      />
      <button onClick={handleAddTask}>Add Task</button>
      <ul>
        {tasks.map((task) => (
          <li key={task.id}>
            <input
              type="checkbox"
              ch ecked={task.completed}
              onChange={() => handleTaskCompletion(task.id)}
            />
            <span style={{ textDecoration: task.completed ? 'line-through' : 'none' }}>
              {task.text}
            </span>
            <button onClick={() => handleDeleteTask(task.id)}>Delete</button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default TaskManager;
