var dgram = require("dgram");

var server = dgram.createSocket({ type: "udp4", reuseAddr: true });

var data;
var hosts = [[new player(0, 0, 0, 0, 0, false, 0, 4, 6, 4)], [new player(0, 0, 0, 0, 0, false, 0, 4, 6, 4)]];

const MSG_TYPE = {
    CREATE_HOST: 0,
    JOIN_HOST: 1,
    STOP_HOST: 2,
    SET_PLAYER_STAT: 3,
    GET_HOSTS: 4,
    GET_PLAYER_STAT: 5,
    GET_NEW_PLAYER: 6,
    CHECK_DISCONNECTED: 7
}

function player(player_number, x, y, move_x, move_y, connected, hair_style_selected, hair_color_selected, skin_color_selected, eye_color_selected) {
    this.x = x;
    this.y = y;
    this.player_number = player_number;
    this.move_x = move_x;
    this.move_y = move_y;
    this.connected = connected;
    this.hair_style_selected = hair_style_selected;
    this.hair_color_selected = hair_color_selected;
    this.skin_color_selected = skin_color_selected;
    this.eye_color_selected = eye_color_selected;
}

server.on("listening", function () {
    disconnected_players();
});
server.on("message", function (msg, rinfo) {
    data = JSON.parse(msg);
    //console.log("< " + String(msg));
    switch (data.type) {
        case MSG_TYPE.SET_PLAYER_STAT:
            set_player_stat(data, rinfo);
            break;
        case MSG_TYPE.CREATE_HOST:
            create_host(data, rinfo);
            break;
        case MSG_TYPE.STOP_HOST:
            stop_host(data, rinfo);
            break;
        case MSG_TYPE.GET_HOSTS:
            get_hosts(data, rinfo);
            break;
        case MSG_TYPE.JOIN_HOST:
            join_host(data, rinfo);
            break;
        case MSG_TYPE.GET_PLAYER_STAT:
            get_player_stat(data, rinfo);
            break;
        case MSG_TYPE.GET_NEW_PLAYER:
            get_players(data, rinfo);
            break;
        default:
            break;
    }
});

function set_player_stat(data, rinfo) {
    for (var i = 0; i < hosts[data.host_number].length; i++) {
        if (hosts[data.host_number][i].player_number == data.player_number) {
            hosts[data.host_number][i].move_x = data.move_x;
            hosts[data.host_number][i].move_y = data.move_y;
            hosts[data.host_number][i].x = data.x;
            hosts[data.host_number][i].y = data.y;
            hosts[data.host_number][i].hair_style_selected = data.hair_style_selected;
            hosts[data.host_number][i].hair_color_selected = data.hair_color_selected;
            hosts[data.host_number][i].skin_color_selected = data.skin_color_selected;
            hosts[data.host_number][i].eye_color_selected = data.eye_color_selected;
            hosts[data.host_number][i].connected = data.connected;
        }
    }

    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
}

function create_host(data, rinfo) {
    var hostNumber = hosts.length;
    hosts.push([new player(0, 0, 0, 0, 0, false, 0, 4, 6, 4)]);

    data.hostNumber = hostNumber;
    data.playerNumber = 0;

    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
    console.table(hosts);
    console.log(hosts);
}

function stop_host(data, rinfo) {
    hosts.splice(hosts.indexOf(data.hostNumber), 1);
    data.res = "stopped";
    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
    console.table(hosts);
}

function get_hosts(data, rinfo) {
    data.hosts = hosts;
    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
}

function join_host(data, rinfo) {
    var number_of_player = 0;
    for (var i = 0; i < hosts[data.host_number].length; i++) {
        if (hosts[data.host_number][i].player_number > number_of_player) {
            number_of_player = hosts[data.host_number][i].player_number;
        }
    }
    hosts[data.host_number].push(new player(number_of_player + 1, 250, 680, 0, 0, true, 0, 4, 6, 4));
    data.player_number = number_of_player + 1;
    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
    console.log("\njoin host - ");
    console.table(hosts);
    for (var i = 0; i < hosts.length; i++) {
        for (var j = 0; j < hosts[i].length; j++) {
            console.log("host - " + i + " player - " + hosts[i][j].player_number)
        }
    }
}

function get_player_stat(data, rinfo) {
    for (var i = 0; i < hosts[data.host_number].length; i++) {
        if (hosts[data.host_number][i].player_number == data.player_number) {
            data.player_stat = hosts[data.host_number][i];
        }
    }
    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
}

function get_players(data, rinfo) {
    data.players = hosts[data.host_number];
    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
}

/*
function disconnect_player(data, rinfo) {
    for (var i = 0; i < hosts[data.host_number].length; i++) {
        if (hosts[data.host_number][i].player_number == data.player_number) {
            console.log("\n\nesse é o cara que eu desconectei: " + hosts[data.host_number][i].player_number + "\n");
            hosts[data.host_number].splice(i, 1);
        }
    }
    console.table(hosts);
    for (var i = 0; i < hosts.length; i++) {
        for (var j = 0; j < hosts[i].length; j++) {
            console.log("host - " + i + " player - " + hosts[i][j].player_number)
        }
    }
    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
}
*/

async function disconnected_players() {
    //await sleep(5000);
    for (var i = 0; i < hosts.length; i++) {
        for (var j = 0; j < hosts[i].length; j++) {
            hosts[i][j].connected = false;
        }
    }
    await sleep(5000);
    for (var i = 0; i < hosts.length; i++) {
        for (var j = 0; j < hosts[i].length; j++) {
            if (!hosts[i][j].connected) {
                console.log("deletando player " + hosts[i][j].player_number + " de host - " + i);
                hosts[i].splice(j, 1);
            }
        }
    }

    console.log("\ndisconnected_players - ");
    console.table(hosts);

    disconnected_players();
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

server.bind(8080, "127.0.0.1");