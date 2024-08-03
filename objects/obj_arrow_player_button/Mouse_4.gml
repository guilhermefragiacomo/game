event_inherited();

switch (global.player_state) {	
	case PLAYER_STATES.STAND_FRONT:
		global.player_state = PLAYER_STATES.STAND_SIDE;
		if (orientation == 1) {
			global.player_xscale = -1;
		} else {
			global.player_xscale = 1;
		}
		break;
	case PLAYER_STATES.STAND_SIDE:
		if (orientation == 1) {
			if (global.player_xscale == 1) {
				global.player_state = PLAYER_STATES.STAND_FRONT;
			} else {
				global.player_state = PLAYER_STATES.STAND_BACK;
			}
		} else {
			if (global.player_xscale == 1) {
				global.player_state = PLAYER_STATES.STAND_BACK;
			} else {
				global.player_state = PLAYER_STATES.STAND_FRONT;
			}
		}
		break;
	case PLAYER_STATES.STAND_BACK:
		global.player_state = PLAYER_STATES.STAND_SIDE;
		if (orientation == -1) {
			global.player_xscale = -1;
		} else {
			global.player_xscale = 1;
		}
		break;
}