var dgram = require("dgram");

var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  port: 3306,
  database: "game"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

var server = dgram.createSocket({ type: "udp4", reuseAddr: true });

var data;
var hosts = [[new player(0, 0, 0, 0, 0, false, 0, 4, 6, 4)], [new player(0, 0, 0, 0, 0, false, 0, 4, 6, 4)]];
var minigames_list = [];

function minigame(id, players_in_minigame, data, player_win) {
    this.id = id;
    this.players_in_minigame = players_in_minigame;
    this.data = data;
    this.player_win = player_win;
}

const MSG_TYPE = {
    CREATE_HOST: 0,
    JOIN_HOST: 1,
    STOP_HOST: 2,
    SET_PLAYER_STAT: 3,
    GET_HOSTS: 4,
    GET_PLAYER_STAT: 5,
    GET_NEW_PLAYER: 6,
    CHECK_DISCONNECTED: 7,
    GET_MINIGAMES: 8,
    SET_MINIGAMES: 9,
    REMOVE_PLAYER_FROM_MINIGAME: 10,
    START_MINIGAME: 11,
    UPDATE_PLAYER_VALUE: 12,
    SAVE_PLAYER: 13,
    SAVE_PAINTING: 14
}

function player(player_number, player_name, x, y, move_x, move_y, connected, hair_style_selected, hair_color_selected, skin_color_selected, eye_color_selected) {
    this.x = x;
    this.y = y;
    this.player_name = player_name;
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
    repeat();
});
server.on("message", function (msg, rinfo) {
    try {
        //console.log('Raw message received:', msg.toString());
        data = JSON.parse(msg.toString());

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
            case MSG_TYPE.SET_MINIGAMES:
                set_minigames(data, rinfo);
                break;
            case MSG_TYPE.GET_MINIGAMES:
                get_minigames(data, rinfo);
                break;
            case MSG_TYPE.REMOVE_PLAYER_FROM_MINIGAME:
                remove_player_from_minigame(data, rinfo);
                break;
            case MSG_TYPE.START_MINIGAME:
                start_minigame(data, rinfo);
                break;
            case MSG_TYPE.UPDATE_PLAYER_VALUE:
                update_player_value(data, rinfo);
                break;
            case MSG_TYPE.SAVE_PLAYER:
                save_player(data, rinfo);
                break;
            case MSG_TYPE.SAVE_PAINTING:
                save_painting(data,rinfo);
            default:
                break;
        }
    } catch (err) {
        console.error('Error parsing JSON:', err.message);
    }
    //console.log("< " + String(msg));
});

function set_player_stat(data, rinfo) {
    for (var i = 0; i < hosts[data.host_number].length; i++) {
        if (hosts[data.host_number][i].player_number == data.player_number) {
            hosts[data.host_number][i].move_x = data.move_x;
            hosts[data.host_number][i].move_y = data.move_y;
            hosts[data.host_number][i].player_name = data.player_name;
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
    hosts.push([new player(0, "", 0, 0, 0, 0, false, 0, 4, 6, 4)]);

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
    console.log("joino");
    console.log(data);
    try {
        sql = "SELECT id FROM player WHERE username = '"+ data.player_name + "' AND id = " + data.player_number + "";
        con.query(sql, function (err, result) {
            console.log(err);
            console.log(result);
            if (result != []) {
                found = false;
                for (var i = 0; i < hosts[data.host_number].length; i++) {
                    if (hosts[data.host_number][i].player_number == result[0].id) {
                        found = true;
                    }
                }
                if (!found) {
                    hosts[data.host_number].push(new player(result[0].id, data.player_name, 250, 680, 0, 0, true, 0, 4, 6, 4));
                    data.player_number = result[0].id;
                    data.joined = true;

                    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
                    console.table(hosts);
                }
            }
        });
    } catch (e) {
        console.log(e)
        server.send(JSON.stringify(data), rinfo.port, rinfo.address);
        console.table(hosts);
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

async function repeat() {
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
                for (var k = 0; k < minigames_list.length; k++) {
                    if ((minigames_list[k].id / 10) - 1 == i) {
                        for (var o = 0; o < minigames_list[k].players_in_minigame.length; o++) {
                            if (minigames_list[k].players_in_minigame[o] == hosts[i][j].player_number) {
                                console.log("\natualizando a minigame_list - ");
                                console.log(minigames_list);
                                minigames_list[k].players_in_minigame.splice(o, 1);
                                console.log("\ndepois");
                                console.log(minigames_list);
                            }
                        }
                    }
                }
                console.log("deletando player " + hosts[i][j].player_number + " de host - " + i);
                hosts[i].splice(j, 1);
            }
        }
    }

    console.log("\ndisconnected players - ");
    console.table(hosts);

    console.log("\n minigames list - ");
    console.log(minigames_list);

    repeat();
}

function set_minigames(data, rinfo) {
    console.log("set (antes) - ")
    console.log(minigames_list);
    if (minigames_list.length == 0) {
        minigames_list.push(new minigame(data.minigame_id, data.players_in_minigame, null, data.player_win));
    } else {
        var found = false;
        for (var i = 0; i < minigames_list.length; i++) {
            if (minigames_list[i].id == data.minigame_id) {
                for (var j = 0; j < data.players_in_minigame; j++) {
                    if (!minigames_list[i].players_in_minigame.includes(data.players_in_minigame[j])) {
                        if (Number.isInteger(data.players_in_minigame[j])) {
                            minigames_list[i].players_in_minigame.push(data.players_in_minigame[j]);
                        }
                    }
                }
                data.players_in_minigame = minigames_list[i].players_in_minigame;
                minigames_list[i].player_win = data.player_win;
                if (data.info != null) {
                    minigames_list[i].data.data = data.info;
                    data.info = minigames_list[i].data;
                    console.log("setando info - ");
                    console.log(minigames_list[i].data.data);
                    next_minigame_round(minigames_list[i], data.time);
                }
                found = true;
            }
        }
        if (!found) {
            minigames_list.push(new minigame(data.minigame_id, data.players_in_minigame, null));
        }
    }
    server.send(JSON.stringify(data), rinfo.port);
    console.log("set - ");
    console.log(minigames_list);
    console.log("\n");
}

function get_minigames(data, rinfo) {
    for (var i = 0; i < minigames_list.length; i++) {
        if (minigames_list[i].id == data.minigame_id) {
            data.players_in_minigame = minigames_list[i].players_in_minigame;
            data.info = minigames_list[i].data;
            data.player_win = minigames_list[i].player_win;
        }
    }
    console.log("get - ");
    console.log(minigames_list);
    console.log("\n");
    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
}

function remove_player_from_minigame(data, rinfo) {
    for (var i = 0; i < minigames_list.length; i++) {
        if (minigames_list[i].id == data.minigame_id) {
            for (var j = 0; j < minigames_list[i].players_in_minigame.length; j++) {
                if (minigames_list[i].players_in_minigame[j] == data.player_number) {
                    minigames_list[i].players_in_minigame.splice(j, 1);
                }
            }
            if (minigames_list[i].players_in_minigame.length == 0) {
                minigames_list[i].data = null;
            }
        }
    }
    console.log("remove from minigame - ");
    console.log(minigames_list);
    console.log("\n");
}

function start_minigame(data, rinfo) {
    console.log(data);
    for (var i = 0; i < minigames_list.length; i++) {
        if (minigames_list[i].id == data.minigame_id) {
            data.players_in_minigame = minigames_list[i].players_in_minigame;
            if (minigames_list[i].data == null) {
                minigames_list[i].data = { id: minigames_list[i].players_in_minigame[Math.floor(Math.random() * minigames_list[i].players_in_minigame.length)], data: data.info, time: data.time };
                minigame_timer(minigames_list[i]);
            }
        }
    }
    console.log("start - ");
    console.log(minigames_list);
    console.log("\n");
    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
}

async function minigame_timer(minigame) {
    var count = minigame.data.time;
    var id = minigame.data.id;
    var time = count;
    for (var k = 0; k < count; k++) {
        await sleep(1000);
        for (var i = 0; i < minigames_list.length; i++) {
            if (minigames_list[i].id == minigame.id) {
                if (minigames_list[i].players_in_minigame.length > 0) {
                    if (minigames_list[i].player_win == -1 || minigames_list[i].player_win == null) {
                        if (id == minigames_list[i].data.id) {
                            console.log("\ntimer - ");
                            console.log(minigames_list[i]);
                            console.log(minigames_list[i].data.data);
                            minigames_list[i].data.time -= 1;
                        } else {
                            count = -4;
                        }
                    } else {
                        count = -4;
                        await sleep(1000)
                        minigames_list.splice(i, 1);
                    }
                } else {
                    count = -4;
                }
            }
        }
    }
    if (count == k) {
        await next_minigame_round(minigame, time);
    }
}

async function next_minigame_round(minigame, time) {
    for (var i = 0; i < minigames_list.length; i++) {
        if (minigames_list[i].id == minigame.id) {
            if (minigames_list[i].players_in_minigame.length > 0) {
                if (minigames_list[i].player_win == -1 || minigames_list[i].player_win == null) {
                    if (minigames_list[i].data.id == minigames_list[i].players_in_minigame[minigames_list[i].players_in_minigame.length - 1]) {
                        minigames_list[i].data.id = minigames_list[i].players_in_minigame[0];
                    } else {
                        var a_id = minigames_list[i].players_in_minigame.indexOf(minigames_list[i].data.id);
                        minigames_list[i].data.id = minigames_list[i].players_in_minigame[a_id + 1];
                    }
                    minigames_list[i].data.time = time;
                    minigame_timer(minigame);
                } else {
                    await sleep(1000)
                    minigames_list.splice(i, 1);
                }
            }
        }
    }
}

async function save_player(data, rinfo) {
    try {
        var sql = "INSERT INTO player (username, psw) VALUES ('" + data.player_name + "', '" + data.password + "')";
        con.query(sql, function (err, result) {
            console.log(err);
            
            var sql = "SELECT id FROM player WHERE username = '" + data.player_name + "'";
            con.query(sql, function (err, result) {
                console.log(err);
                data.player_number = result[0].id;

                var sql = "INSERT INTO player_statistics (id, hair_style, hair_color, skin_color, eye_color) VALUES (" + result[0].id + ", '" + data.hair_style + "', '" + data.hair_color + "', '" + data.skin_color + "', '" + data.eye_color + "')";
                con.query(sql, function (err, result) {
                    console.log(err);
                    data.saved = true;
                    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
                });
            });
        });
        
        
    } catch (e) {
        console.log(e);
    }
}

async function save_painting(data,rinfo) {
    try {
        var sql = "SELECT id, packet, painting FROM player_paintings WHERE player_id = " + data.player_number + " ORDER BY created_at DESC";
        con.query(sql, function (err, result) {
            console.log(err);
            if (result[0] == null || result[0].packet == 6) {
                if (data.packet == 1) {
                    var sql = "INSERT INTO player_paintings (player_id, painting, packet) VALUES (" + data.player_number + ", '" + data.painting + "', '" + data.packet + "')";
                    con.query(sql, function (err, result) {
                        console.log("Insert");
                        console.log(err);
                        data.success = true;
                        server.send(JSON.stringify(data), rinfo.port, rinfo.address);
                    });
                }
            } else {
                if (result[0].packet == data.packet-1) {
                    var sql = "UPDATE player_paintings SET packet = " + (data.packet) + ", painting = '" + (result[0].painting.concat(data.painting)) + "' WHERE id = " + result[0].id;
                    con.query(sql, function (err, result) {
                        console.log("Updated");
                        console.log(err);
                        data.success = true;
                        server.send(JSON.stringify(data), rinfo.port, rinfo.address);
                    });
                }
            }
        });
    } catch (e) {
        console.log(e);
    }
};

function update_player_value(data, rinfo) {

}

function login(data, rinfo) {
    try {
        var sql = "SELECT id FROM player WHERE username = '" + data.player_name + "' && password = '" + data.password + "'";
        con.query(sql, function (err, result) {
            console.log(result);
            //data.player_number = result[0].id;
            //data.hair_style = 
            //server.send(JSON.stringify(data), rinfo.port, rinfo.address);
        });
    } catch (e) {
        console.log(e);
    }
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

server.bind(8080, "127.0.0.1");