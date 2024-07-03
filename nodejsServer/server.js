var dgram = require("dgram");

var server = dgram.createSocket({ type: "udp4", reuseAddr: true });

var data;
var hosts = [[new player(0, 0, 0, 0, 0)], [new player(0, 0, 0, 0, 0)]];

const MSG_TYPE = {
    CREATE_HOST: 0,
    JOIN_HOST: 1,
    STOP_HOST: 2,
    SET_PLAYER_STAT: 3,
    GET_HOSTS: 4,
    GET_PLAYER_STAT: 5,
    GET_NEW_PLAYER: 6,
    REMOVE_PLAYER: 7,
    CHECK_DISCONNECTED: 8
}

function player(player_number, x, y, move_x, move_y, connected) {
    this.x = x;
    this.y = y;
    this.player_number = player_number;
    this.move_x = move_x;
    this.move_y = move_y;
    this.connected = connected;
}

server.on("message", function (msg, rinfo) {
    data = JSON.parse(msg);
    console.log("< " + String(msg));
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
        case MSG_TYPE.CHECK_DISCONNECTED:
            check_disconnected(data, rinfo);
            break;
        case MSG_TYPE.REMOVE_PLAYER:
            remove_player(data, rinfo);
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
            hosts[data.host_number][i].connected = data.connected;
        }
    }

    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
}

function create_host(data, rinfo) {
    var hostNumber = hosts.length;
    hosts.push([new player(0, 0, 0, 0, 0)]);

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
    hosts[data.host_number].push(new player(number_of_player + 1, 250, 680, 0, 0));
    data.player_number = number_of_player + 1;
    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
    console.table(hosts);
}

function get_player_stat(data, rinfo) {
    var o = false;
    for (var i = 0; i < hosts[data.host_number].length; i++) {
        if (hosts[data.host_number][i].player_number == data.player_number) {
            data.player_stat = hosts[data.host_number][i];
            console.log("--=-=-= " + hosts[data.host_number][i].player_number);
            o = true;
        }
    }
    if (o) {
        server.send(JSON.stringify(data), rinfo.port, rinfo.address);
    }
}

function get_players(data, rinfo) {
    for (var i = 0; i < hosts[data.host_number].length; i++) {
        hosts[data.host_number][i].connected = false;
    }
    data.players = hosts[data.host_number];
    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
}
function check_disconnected(data, rinfo) {
    data.players = hosts[data.host_number];
    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
    for (var i = 0; i < hosts[data.host_number].length; i++) {
        if (!hosts[data.host_number][i].connected) {
            hosts[data.host_number].splice(i, 1);
        }
    }
    console.table(hosts);
}
function remove_player(data, rinfo) {
    for (var i = 0; i < hosts[data.host_number].length; i++) {
        if (hosts[data.host_number][i].player_number == data.player_number) {
            hosts[data.host_number][i].connected = false;
        }
    }
    data.type = MSG_TYPE.CHECK_DISCONNECTED;
    check_disconnected(data, rinfo);
}

server.bind(8080, "127.0.0.1");