import { REMOVE_STEP } from "../actions/step_actions";
import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from "../actions/todo_actions";

// const initialState = {
//     1: {
//       id: 1,
//       title: "wash car",
//       body: "with soap",
//       done: false
//     },
//     2: {
//       id: 2,
//       title: "wash dog",
//       body: "with shampoo",
//       done: true
//     }
//   };

        [{
          id: 1,
          title: "wash car",
          body: "with soap",
          done: false
        },
        {
          id: 2,
          title: "wash dog",
          body: "with shampoo",
          done: true
        },
        {
            id: 3,
            title: "car dog",
            body: "with leather",
            done: true
          }
    ]


const todosReducer = (state= {}, action) => {
    Object.freeze(state);
    const newState = Object.assign({}, state)
    switch (action.type){
        
        case RECEIVE_TODOS:
            action.todos.forEach((todo)=> {
                newState[todo.id] = todo;
            })
            return newState

        case RECEIVE_TODO:
            newState[action.todo.id] = action.todo;
            return newState

        case REMOVE_TODO:
            delete newState[action.todo.id];
            return newState

        default: 
            return state; 
    }
}
export default todosReducer;