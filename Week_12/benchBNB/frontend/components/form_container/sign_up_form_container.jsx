import SessionForm from "./session_form";
import {connect} from 'react-redux'
import {signUp} from '../../actions/session_actions'

const mapStateToProps = (state, ownProps) => ({
   errors: state.errors.session,
   currentUser: state.session.id,
   formType: 'signUp',
})

const mapDispatchToProps = (dispatch) => ({
   processForm: (user) => dispatch(signUp(user))
})

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm)