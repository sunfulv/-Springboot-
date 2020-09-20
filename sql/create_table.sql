-- 首先创建用户表sys_user
create table if not exists sys_user(
	id bigint(20) not null auto_increment comment '用户编号',
	name varchar(50) not null comment '用户名',
	nick_name varchar(150) default null comment '昵称',
	avatar varchar(150) default null comment '头像',
	password varchar(100) default null comment '密码',
	salt varchar(40) default null comment '加密盐',
	email varchar(100) default null comment '邮箱',
	moblie varchar(100) default null comment '手机',
	status tinyint(4) default null comment '状态:0,正常,1,禁用',
	dept_id bigint(20) default null comment '所属机构id',
	create_by varchar(50) default null comment '创建人',
	create_time datetime default null comment '创建时间',
	last_update_by varchar(50) default null comment '最近一次更新人',
	last_update_time datetime default null comment '最近一次更新的时间',
	del_flag tinyint(4) default '0' comment '是否删除 -1,已删除,0,正常',
	primary key(id),
	unique key name (name)
)ENGINE=InnoDB AUTO_INCREMENT=34 default CHARSET=utf8 comment='用户管理';

-- 创建角色表sys_role
create table if not exists sys_role(
	id bigint(20) not null auto_increment comment '编号',
	name varchar(100) default null comment '角色名称',
	remark varchar(100) default null comment '备注',
	create_by varchar(50) default null comment '创建者',
	create_time datetime default null comment '创建时间',
	last_update_by varchar(50) default null comment '最近一次更新者',
	last_update_time datetime default null comment '最近一次更新的时间',
	dal_flag tinyint(4) default '0' comment '是否删除 -1,删除，0:正常',
	primary key(id)
)ENGINE=InnoDB auto_increment=9 default charset=utf8 comment '角色管理';

-- 创建机构表sys_dept
create table if not exists sys_dept(
	id bigint(20) not null auto_increment comment '编号',
	name varchar(50) default null comment '机构名称',
	parent_id bigint(20) default null comment '上级机构编号',
	order_num int(11) default null comment '排序',
	create_by varchar(50) default null comment '创建者',
	create_time datetime default null comment '创建时间',
	last_update_by varchar(50) default null comment '最近一次更新者',
	last_update_time datetime default null comment '最近一次更新的时间',
	dal_flag tinyint(4) default '0' comment '是否删除 -1,删除，0:正常',
	primary key(id)
)ENGINE=InnoDB auto_increment=36 default charset=utf8 comment '机构管理';

-- 创建菜单表
create table if not exists sys_menu(
	id bigint(20) not null auto_increment comment '编号',
	name varchar(50) default null comment '菜单名称',
	parent_id bigint(20) default null comment '父菜单编号',
	url varchar(200) default null 
		comment '菜单URL，类型: 1.普通页面,2. 嵌套完整页面, http(s)开头的链接 3. 嵌套服务器页面',
	
	perms varchar(500) default null comment '授权',
	type int(11) default null comment '类型：0:目录，1:菜单，2:按钮',
	icon varchar(50) default null comment '菜单图标',
	order_num int(11) default null comment '排序',
	create_by varchar(50) default null comment '创建者',
	create_time datetime default null comment '创建时间',
	last_update_by varchar(50) default null comment '最近一次更新者',
	last_update_time datetime default null comment '最近一次更新的时间',
	dal_flag tinyint(4) default '0' comment '是否删除 -1,删除，0:正常',
	primary key(id)
)ENGINE=InnoDB auto_increment=45 default charset=utf8 comment='菜单管理';

-- 创建中间表
-- 用户角色表sys_user_role
create table if not exists sys_user_role(
	id bigint(20) not null auto_increment comment '编号',
	user_id bigint(20) default null comment '用户编号',
	role_id bigint(20) default null comment '角色编号',
	create_by varchar(50) default null comment '创建者',
	create_time datetime default null comment '创建时间',
	last_update_by varchar(50) default null comment '最近一次更新者',
	last_update_time datetime default null comment '最近一次更新的时间',
	primary key(id)
)ENGINE=InnoDB auto_increment=76 default charset=utf8 comment '用户角色表';

-- 角色菜单表sys_role_menu
create table if not exists sys_role_menu(
	id bigint(20) not null auto_increment comment '编号',
	role_id bigint(20) default null comment '角色编号',
	menu_id bigint(20) default null comment '菜单编号',
	create_by varchar(50) default null comment '创建者',
	create_time datetime default null comment '创建时间',
	last_update_by varchar(50) default null comment '最近一次更新者',
	last_update_time datetime default null comment '最近一次更新的时间',
	primary key(id)
)ENGINE=InnoDB auto_increment=469 default charset=utf8 comment='角色菜单表';

-- 角色机构表sys_role_dept
create table if not exists sys_role_dept(
	id bigint(20) not null auto_increment comment '编号',
	role_id bigint(20) default null comment '角色编号',
	dept_id bigint(20) default null comment '机构编号',
	create_by varchar(50) default null comment '创建者',
	create_time datetime default null comment '创建时间',
	last_update_by varchar(50) default null comment '最近一次更新者',
	last_update_time datetime default null comment '最近一次更新的时间',
	primary key(id)
)ENGINE=InnoDB auto_increment=4 default charset=utf8 comment='角色机构表';


-- 下面是一些系统层面的表
-- 字典表sys_dict,用来存放一些常用的枚举类型
create table if not exists sys_dict(
	id bigint(20) not null auto_increment comment '编号',
	value varchar(100) not null comment '数据值',
	label varchar(100) not null comment '标签(键)',
	type varchar(100) not null comment '类型',
	description varchar(100) not null comment '描述',
	sort decimal(10,0) not null comment '排序',
	create_by varchar(50) default null comment '创建者',
	create_time datetime default null comment '创建时间',
	last_update_by varchar(50) default null comment '最近一次更新者',
	last_update_time datetime default null comment '最近一次更新的时间',
	dal_flag tinyint(4) default '0' comment '是否删除 -1,删除，0:正常',
	primary key(id)
)ENGINE=InnoDB auto_increment=5 default charset=utf8 comment='字典表';

-- 配置表sys_config, 存储系统配置信息
create table if not exists sys_config(
	id bigint(20) not null auto_increment comment '编号',
	value varchar(100) not null comment '数据值',
	label varchar(100) not null comment '标签名',
	type varchar(100) not null comment '类型',
	description varchar(100) not null comment '描述',
	sort decimal(10,0) not null comment '排序',
	create_by varchar(50) default null comment '创建者',
	create_time datetime default null comment '创建时间',
	last_update_by varchar(50) default null comment '最近一次更新者',
	last_update_time datetime default null comment '最近一次更新的时间',
	dal_flag tinyint(4) default '0' comment '是否删除 -1,删除，0:正常',
	primary key(id)
)ENGINE=InnoDB auto_increment=5 default charset=utf8 comment='系统配置表';

-- 操作日志表sys_log，记录用户的日常操作信息
create table if not exists sys_log(
	id bigint(20) not null auto_increment comment '编号',
	user_name varchar(50) default null comment '用户名',
	operation varchar(50) default null comment '用户操作',
	method varchar(200) default null comment '请求方法',
	params varchar(5000) default null comment '请求参数',
	time bigint(20) default null comment '执行时长',
	ip varchar(64) default null comment 'ip地址',
	create_by varchar(50) default null comment '创建者',
	create_time datetime default null comment '创建时间',
	last_update_by varchar(50) default null comment '最近一次更新者',
	last_update_time datetime default null comment '最近一次更新的时间',
	primary key(id)
)ENGINE=InnoDB auto_increment=2798 default charset=utf8 comment='操作日志表';

-- 登录日志表sys_login_log 记录用户的登录和退出状态
create table if not exists sys_login_log(
	id bigint(20) not null auto_increment comment'编号',
	user_name varchar(50) default null comment '用户名',
	status varchar(50) default null comment '登录状态,online（在线）,login,logout',
	ip varchar(64) default null comment 'ip地址',
	create_by varchar(50) default null comment '创建者',
	create_time datetime default null comment '创建时间',
	last_update_by varchar(50) default null comment '最近一次更新者',
	last_update_time datetime default null comment '最近一次更新的时间',
	primary key(id)
)ENGINE=InnoDB auto_increment=2798 default charset=utf8 comment='登录日志表';