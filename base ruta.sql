create Database if not exists rutaAmigapp; -- (ok)

use rutaAmigapp;

create table IF NOT EXISTS rol(
idRol INT primary key,
nombre varchar(30) not null,
nivel INT,
usuario_idusuario int
);

-- drop table rol;


create table IF NOT EXISTS marcadores (
idMarcadores Int primary key auto_increment,
longitud float not null,
latitud float not null,
estado tinyint,
tiempo_recorrido time
);

create table IF NOT EXISTS notificaciones (
idNotificaciones INT primary key auto_increment,
intervalo INT  not null,
fecha_hora DATETIME not null,
ruta_idruta int
);

drop table  notificaciones;

create table IF NOT EXISTS rutas(
idRutas INT PRIMARY KEY auto_increment,
numero INT not null,
descripcion VARCHAR(45),
sentido VARCHAR(45) not null
);

create table IF NOT EXISTS comentarios (
idComentarios INT PRIMARY KEY auto_increment,
fecha DATE not null,
hora TIME not null,
comentario VARCHAR (45) not null,
usuario_idusuario int
);

create table IF NOT EXISTS mapa_rutas(
rutas_idrutas int primary key auto_increment,
notificaciones_idnotificaciones int,
usuario_idusuario Int,
marcadores_mapa_marcadores_idmarcadores int
);

create table IF NOT EXISTS marcadores_mapa(
marcadores_idmarcadores int primary key auto_increment
);

create table IF NOT EXISTS foro(
idForo int primary key auto_increment,
usuarios_idusuario int,
comentarios_idcomentarios int,
estado tinyint not null
);

drop table foro;

create table IF NOT EXISTS usuario(
idUsuario int primary key auto_increment,
nombre_usuario VARCHAR(45) null,
apellido_usuario VARCHAR(45) not null,
correo_usuario VARCHAR(45) not null,
password_usuario VARCHAR(45) not null,
estado_usuario tinyint,
fecha_creacion DATETIME not null,
fecha_actualizacion DATETIME,
fecha_eliminacion DATETIME
);


-- FOREINY KEYS
-- rol- usuario --> ok
ALTER TABLE rol add constraint fk_rol_usuario foreign key (usuario_idusuario) references usuario(idUsuario);

-- comentaios- usuario --> ok
ALTER TABLE comentarios add constraint fk_comentarios_usuario foreign key (usuario_idusuario) references usuario(idUsuario);

-- foro-usuario -->ok
ALTER TABLE foro add constraint fk_foro_usuario foreign key (usuarios_idusuario) references usuario(idUsuario);
-- foro-comentario -->ok
ALTER TABLE foro add constraint fk_foro_comentarios foreign key (comentarios_idcomentarios) references usuario(idUsuario);

-- comentarios-usuario -->ok
ALTER TABLE comentarios add constraint fk_comentarios_usuario foreign key (usuario_idusuario) references usuario(idUsuario);

-- notificaciones-rutas --> ok
ALTER TABLE notificaciones add constraint fk_notificaciones_rutas foreign key (ruta_idruta) references rutas(idRutas);

-- mapa-marcadores --> ok
ALTER TABLE marcadores_mapa add constraint fk_marcadores_mapa_marcadores foreign key (marcadores_idmarcadores) references marcadores(idMarcadores);


-- mapa-rutas - ruta  --> ok
ALTER TABLE mapa_rutas add constraint fk_mapa_rutas_ruta foreign key (rutas_idrutas) references rutas(idRutas);
-- mapa-rutas - marcadores_mapa  --> ok
ALTER TABLE mapa_rutas add constraint fk_mapa_rutas_marcadores_mapa foreign key (marcadores_mapa_marcadores_idmarcadores) references marcadores_mapa(marcadores_idmarcadores);
-- mapa-rutas - notificaciones  --> ok
ALTER TABLE mapa_rutas add constraint fk_mapa_rutas_notificaciones foreign key (notificaciones_idnotificaciones) references notificaciones(idNotificaciones);