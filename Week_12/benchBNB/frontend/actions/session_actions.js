import * as SessionAPI from "../util/session_api_util";

export const CREATE_USER = "CREATE_USER";
export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
export const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS";

const receiveCurrentUser = user => ({
  type: RECEIVE_CURRENT_USER,
  user
})

const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER
})

export const receiveErrors = errors => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
})

export const signUp = user => dispatch => {
  
  SessionAPI.signUp(user)
    .then(user => dispatch(receiveCurrentUser(user)))
}

export const login = user => dispatch => {
  SessionAPI.login(user)
    .then(user => dispatch(receiveCurrentUser(user)))
}

export const logout = () => dispatch => {
  SessionAPI.logout()
    .then(() => dispatch(logoutCurrentUser()))
}