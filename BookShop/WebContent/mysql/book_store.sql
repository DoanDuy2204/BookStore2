create database book_store;
create table category(
	id int not null primary key,
    name varchar(45) null,
    description varchar(45) null
);
INSERT INTO `book_storedb`.`category` (`id`, `name`, `description`) VALUES ('1', 'Sách giáo khoa', 'Cho học sinh các cấp');
INSERT INTO `book_storedb`.`category` (`id`, `name`, `description`) VALUES ('2', 'Sách lịch sử', 'Cho mọi lứa tuổi, lịch sử Việt Nam');
INSERT INTO `book_storedb`.`category` (`id`, `name`, `description`) VALUES ('3', 'Sách thiếu nhi', 'Cho lứa tuổi thiếu nhi');
INSERT INTO `book_storedb`.`category` (`id`, `name`, `description`) VALUES ('4', 'Sách văn học', 'Cho mọi lứa tuổi yêu thích văn học Việt nam');
INSERT INTO `book_storedb`.`category` (`id`, `name`, `description`) VALUES ('5', 'Truyện tranh', 'Cho mọi lứa tuổi');

create table publishHouse(
	id int not null primary key,
    name varchar(45) null,
    address varchar(45) null
);

insert into publishHouse(id,name,address) values(1,'NSB Kim Đồng','Thanh Xuân, Hà Nội');
insert into publishHouse(id,name,address) values(2,'NSB Giáo Dục','Thanh Xuân, Hà Nội');
insert into publishHouse(id,name,address) values(3,'NSB Trẻ','Thanh Xuân, Hà Nội');


create table books(
	id int NOT NULL UNIQUE,
    category_id int NOT NULL,
    publishHouse_id int Null,
    name varchar(45) NOT NULL,
    price double NULL,
    srcImage varchar(45) NOT NULL,
    soldNumber int NULL,
    description1 varchar(45) null,
    description2 varchar(45) null,
	Primary key(id),
    Foreign key(category_id) references category(id),
	Foreign key(publishHouse_id) references publishHouse(id)
);
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('1', '1', '1', 'Giải Tích 12', '25000', 'giaitich12', '20');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('2', '1', '2', 'Hình Học 12', '30000', 'hinhhoc12', '20');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('3', '1', '1', 'Hóa Học 9', '38000', 'hoahoc9', '15');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('4', '1', '2', 'Hóa Học 12', '40000', 'hoahoc12', '26');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('5', '1', '1', 'Tiếng Việt 3', '25000', 'tiengviet3', '21');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('6', '1', '2', 'Toán 4', '25000', 'toan4', '32');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('7', '1', '1', 'Toán 9', '31000', 'toan9', '35');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('8', '1', '1', 'Vật Lí 8', '32000', 'vatli8', '36');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('9', '1', '1', 'Vật Lí 12', '31000', 'vatli12', '24');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('10', '1', '1', 'Vật lý 7', '25000', 'vatli7', '21');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('11', '1', '1', 'Vật Lý 9', '25000', 'vatli9', '15');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('12', '1', '1', 'Vở bài tập toán 2', '28000', 'vobttoan2', '32');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('13', '1', '2', 'Vở bài tập toán 5', '28000', 'vobttoan5', '31');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('14', '2', '2', 'Cảo thơm trước đèn', '35000', 'caothomtruocden', '50');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('15', '2', '2', 'Kể chuyện danh nhân Việt Nam 6', '105000', 'kechuyendanhnhanvietnam6', '11');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('16', '2', '2', 'Đại việt sử kí toàn thư', '23000', 'daivietsukitoanthu', '25');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('17', '2', '2', 'Kể chuyện danh nhân Việt Nam 1', '36400', 'kechuyendanhnhanvietnam1', '31');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('18', '2', '2', 'Lịch sử nội chiến Việt Nam', '35600', 'lichsunoichienvietnam', '36');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('19', '2', '1', 'Lịch sử Việt Nam qua tranh', '35000', 'lichsuvietnambangtranh', '21');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('20', '2', '1', 'Nam Quốc Sơn Hà', '45000', 'namquocsonha', '61');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('21', '2', '1', 'Người thắp lửa', '64000', 'nguoithaplua', '38');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('22', '2', '2', 'Việt Nam Phong tục', '36000', 'vietnamphongtuc', '34');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('23', '3', '1', 'Chuyện con mèo dạy hải âu bay', '55000', 'chuyenconmeodayhaiaubay', '50');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('24', '3', '1', 'Có hai con mèo ngoài cừa sổ', '35000', 'cohaiconmeongoaicuaso', '12');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('25', '3', '1', 'Đảo mộng mơ', '60000', 'daomongmo', '34');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('26', '3', '1', 'Hoàng tử bé', '21000', 'hoangtube', '35');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('27', '3', '1', 'Ngôi trường mọi khi', '35000', 'ngoitruongnhieukhi', '12');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('28', '3', '1', 'Vì sao tớ yêu bố', '47000', 'visaotoyeubo', '15');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('29', '4', '2', 'Anh chỉ là thanh xuân của em', '68000', 'Anhchilathanhxuancuaem', '32');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('30', '4', '2', 'Thời thanh xuân đẹp nhất của chúng ta', '108000', 'thoithanhxuandepnhatcuachungta', '35');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('31', '4', '1', 'Bảy bước tới mùa hè', '64000', 'baybuoctoimuahe', '21');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('32', '4', '3', 'Chuyện về những người cô đơn', '55000', 'chuyenvenhungnguoicodon', '31');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('33', '4', '2', 'Đắc nhân tâm', '145000', 'dacnhantam', '150');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('34', '4', '1', 'Đời ngắn đừng ngủ dài', '23000', 'doingandungngudai', '32');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('35', '4', '3', 'Lẽ nào e m không biết', '65000', 'lenaoemkhongbiet', '35');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('36', '4', '2', 'Nhà giả kim', '135000', 'nhagiakim', '100');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('37', '4', '2', 'Nhận biết cơ hội thành công', '26000', 'nhanbietcohoithanhcong', '23');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('38', '4', '3', 'Ông trăm tuổi', '64000', 'ongtramtuoi', '52');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('39', '4', '1', 'Thất tình không mưa', '58000', 'thattinhkhongmua', '13');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('40', '4', '3', 'Tôi thấy hoa vàng trên cỏ xanh', '64000', 'toithayhoavangtrencoxanh', '120');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('41', '4', '2', 'Tuổi thơ dữ dội', '35000', 'tuoithodudoi', '23');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('42', '4', '1', 'Yêu em từ cái nhìn đầu tiên', '64000', 'yeuemtucainhindautien', '65');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('43', '5', '3', 'Conan tập 86', '16000', 'conan86', '50');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('44', '5', '2', 'Connan phần đặc biệt', '25000', 'conandacbiet', '60');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('45', '5', '1', 'Conan tập 1', '16000', 'conan1', '50');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('46', '5', '1', 'Conan tập 21', '16000', 'conan21', '55');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('47', '5', '1', 'Conan tập 26', '16000', 'conan26', '100');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('48', '5', '1', 'Conan tập 35', '16000', 'conan35', '58');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('49', '5', '2', 'Conan tập 42', '16000', 'conan42', '64');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('50', '5', '2', 'Conan tập 62', '16000', 'conan62', '62');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('51', '5', '3', 'Conan tập 72', '16000', 'conan72', '20');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('52', '5', '1', 'Conan tập 91', '16000', 'conan91', '60');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('53', '5', '3', 'Conan tập 92', '16000', 'conan92', '80');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('54', '5', '2', 'Conan tập 93 ', '16000', 'conan93', '60');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('55', '5', '1', 'Doremon đại tuyển tập', '123000', 'doremondaituyentap', '51');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('56', '5', '2', 'Doremon 1', '22000', 'doremon1 ', '21');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('57', '5', '1', 'Doremon 6', '22000', 'doremon6', '54');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('58', '5', '2', 'Hunterxhunter_27', '18000', 'hunterxhunter', '23');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('59', '5', '3', 'Miko : Edo rắc rối kí', '36000', 'mikodacbiet', '50');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('60', '5', '2', 'Miko 2', '25000', 'mik2', '65');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('61', '5', '1', 'Miko 3', '25000', 'miko3', '61');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('62', '5', '2', 'Miko 10', '25000', 'miko10', '65');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('63', '5', '1', 'Onepiece 3', '45000', 'onepiece3', '21');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('64', '5', '2', 'Onepiece 86', '45000', 'onepiece86', '21');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('65', '5', '3', 'One punch man1', '32000', 'onepunch1', '54');
INSERT INTO `book_storedb`.`books` (`id`, `category_id`, `publishHouse_id`, `name`, `price`, `srcImage`, `soldNumber`) VALUES ('66', '5', '2', 'Onepunch 15', '32000', 'onepunch2', '87');

create table author(
	id int not null primary key,
    name varchar(45) null
);
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('2', 'Hạ Vũ');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('3', 'Cổ Mạn');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('4', 'Bát Nguyệt Trường Ân');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('5', 'Fujo fujko');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('6', 'Paulo Coelho');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('7', 'DaleCarnegie');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('8', 'Gosho Aoyama');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('9', 'Oda Eiichi');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('10', 'Ono Eriko');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('11', 'One');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('12', 'Robin Sarma');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('13', 'Lan Rùa');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('14', 'Jon asjon asson');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('15', 'Lâu Vũ Tình');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('16', 'Phùng Quán');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('17', 'Luis Sepulvena');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('18', 'Le Petit Prince');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('19', 'DanielHowarth');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('20', 'Phan Huy Chú');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('21', 'Lê Minh Quốc');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('22', 'Trần Bạch Đằng');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('23', 'Tạ Chí Đại Trường');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('24', 'Lý Thường Kiệt');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('25', 'Barak Levi');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('1', 'Nguyễn Nhật Ánh');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('26', 'Nhiều tác giả');
INSERT INTO `book_storedb`.`author` (`id`, `name`) VALUES ('27 ', 'Phan Kế Bình');



create table author_books(
	id int not null primary key,
    book_id int null ,
    author_id int null,
    revenue double null,
    Foreign key(book_id) references books(id),
	Foreign key(author_id) references author(id)
);
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('1', '1', '26', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('2', '2', '26', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('3', '3', '26', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('4', '4', '26', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('5', '5', '26', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('6', '6', '26', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('7', '7', '26', '0.03');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('8', '8', '26', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('9', '9', '26', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('10', '10', '26', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('11', '11', '26', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('12', '12', '26', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('13', '13', '26', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('14', '14', '20', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('15', '15', '21', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('16', '16', '26', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('17', '17', '23', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('18', '18', '23', '0.00');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('19', '19', '22', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('20', '20', '24', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('21', '21', '26', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('22', '22', '27', '0.03');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('23', '23', '17', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('24', '24', '1', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('25', '25', '1', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('26', '26', '8', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('27', '27', '1', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('28', '28', '19', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('29', '29', '2', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('30', '30', '4', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('31', '31', '1', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('32', '32', '2', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('33', '33', '7', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('34', '34', '12', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('35', '35', '13', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('36', '36', '6', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('37', '37', '16', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('38', '38', '14', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('39', '39', '15', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('40', '40', '1', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('41', '41', '16', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('42', '42', '3', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('43', '43', '10', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('44', '44', '10', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('45', '45', '10', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('46', '46', '10', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('47', '47', '10', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('48', '48', '10', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('49', '49', '10', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('50', '50', '10', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('51', '51', '10', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('52', '52', '10', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('53', '53', '10', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('54', '54', '10', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('55', '55', '5', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('56', '56', '5', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('57', '57', '5', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('58', '58', '10', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('59', '59', '11', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('60', '60', '11', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('61', '61', '11', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('62', '62', '11', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('63', '63', '9', '0.03');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('64', '64', '9', '0.02');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('65', '65', '9', '0.01');
INSERT INTO `book_storedb`.`author_books` (`id`, `book_id`, `author_id`, `revenue`) VALUES ('66', '66', '9', '0.02');


create table customer(
	id int not null primary key,
    name varchar(45) not null,
    address varchar(45) null,
    email varchar(45) null,
    gender varchar(10) null,
    numberPhone varchar(45) null,
    dob datetime null
);

insert into customer(id,name,address,email,gender,numberPhone,dob) values(1,'Đoàn Văn Duy','Bắc Giang','doanvanduy2204@gmail.com','Male','0343620805','1998-04-22');
insert into customer(id,name,address,email,gender,numberPhone,dob) values(2,'Nguyễn Thị Ánh','Bắc Giang','NguyenAnh2704@gmail.com','Female','0343620805','1998-04-27');
create table employee(
	id int not null primary key,
    name varchar(45) not null,
    position varchar(45) not null,
    office varchar(45) null,
    dob datetime null,
    email varchar(45) not null,
    numberPhone varchar(15) null,
    srcImage varchar(45) null
);

insert into employee(id,name,position,dob,email,numberPhone) values(1,'Nguyễn Thị A','manager','1999-04-27','nguyenthia@gmail.com','0343620805');

create table bill(
	id int not null primary key,
    customer_id int not null,
    employee_id int not null,
    dob datetime null,
    Foreign key(customer_id) References customer(id),
	Foreign key(employee_id) References employee(id)
);
INSERT INTO `book_storedb`.`bill` (`id`, `customer_id`, `employee_id`, `dob`) VALUES ('1', '1', '1', '2018-10-29');
INSERT INTO `book_storedb`.`bill` (`id`, `customer_id`, `employee_id`, `dob`) VALUES ('2', '1', '1', '2018-10-28');
INSERT INTO `book_storedb`.`bill` (`id`, `customer_id`, `employee_id`, `dob`) VALUES ('3', '2', '1', '2018-10-28');
INSERT INTO `book_storedb`.`bill` (`id`, `customer_id`, `employee_id`, `dob`) VALUES ('4', '2', '1', '2018-10-28');


create table bill_books(
	id int not null primary key,
    book_id int not null,
    bill_id int not null,
    quantity int not null,
	Foreign key(book_id) References books(id),
	Foreign key(bill_id) References bill(id)
);
INSERT INTO `book_storedb`.`bill_books` (`id`, `book_id`, `bill_id`, `quantity`) VALUES ('1', '4', '1', '10');
INSERT INTO `book_storedb`.`bill_books` (`id`, `book_id`, `bill_id`, `quantity`) VALUES ('2', '5', '1', '12');
INSERT INTO `book_storedb`.`bill_books` (`id`, `book_id`, `bill_id`, `quantity`) VALUES ('3', '6', '1', '11');
INSERT INTO `book_storedb`.`bill_books` (`id`, `book_id`, `bill_id`, `quantity`) VALUES ('4', '4', '1', '2');
INSERT INTO `book_storedb`.`bill_books` (`id`, `book_id`, `bill_id`, `quantity`) VALUES ('5', '2', '2', '5');
INSERT INTO `book_storedb`.`bill_books` (`id`, `book_id`, `bill_id`, `quantity`) VALUES ('6', '2', '2', '10');
INSERT INTO `book_storedb`.`bill_books` (`id`, `book_id`, `bill_id`, `quantity`) VALUES ('7', '6', '2', '3');

create table user(
	username varchar(45) not null primary key,
    customer_id int not null,
    node varchar(45) null,
    password varchar(45) not null,
    foreign key(customer_id) references customer(id)
);
insert into user(username,customer_id,password) values('DoanDuy',1,'1234');
insert into user(username,customer_id,password,node) values('NguyenAnh',2,'1234','admin');