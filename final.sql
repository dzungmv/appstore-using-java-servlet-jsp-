create database Final
use Final

create table Account(
	id int IDENTITY(1,1) PRIMARY KEY,
	username varchar(20),
	password varchar(20),
	isDev int,
	isAdmin int,
	isBlocked int
)

create table Userinfo(
	id int not null PRIMARY KEY,
	username varchar(20),
	fullname nvarchar(50),
	dob date,
	address nvarchar(100),
	phone varchar(10),
	mail varchar(30),
	money int
)

create table VerifyCode(
	username varchar(20) Primary key,
	code varchar(6)
)

create table product(
	id int identity primary key not null,
	name nvarchar(max),
	categories bit,
	description nvarchar(max),
	dev nvarchar(max),
	fee int,
	downloadcount int,
	size float,
	rate int,
	isApproved int,
	release date
)

create table rate(
	id int not null,
	rating int,
	comment nvarchar(max)
)

create table cart(
	id_user int not null,
	id_product int not null,
)

create table wishlist(
	id_user int not null,
	id_product int not null,
)

create table card(
	denominations int,
	recharge_code char(10) primary key
)

create table purchase_history(
	id_product int,
	id_user int,
	purchase_date date,
	price int
	primary key(id_product, id_user)
)

alter table userinfo
add constraint fk_userinfo_id
foreign key (id) references account(id)

alter table rate
add constraint fk_rate_id
foreign key (id) references product(id)

alter table cart
add constraint fk_cart_id_user
foreign key (id_user) references account(id)

alter table cart
add constraint fk_cart_id_product
foreign key (id_product) references product(id)

alter table wishlist
add constraint fk_wishlist_id_user
foreign key (id_user) references account(id)

alter table wishlist
add constraint fk_wishlist_id_product
foreign key (id_product) references product(id)

alter table purchase_history
add constraint fk_purchase_history_id_user
foreign key (id_user) references account(id)

alter table purchase_history
add constraint fk_purchase_history_id_product
foreign key (id_product) references product(id)

create trigger updateRate
on rate
for insert
as
begin
	declare @id_product int;
	select @id_product = id from inserted;
	
	declare @sum_of_rate float,
			@total_rate int

	set @sum_of_rate = (select sum(rating) from rate where id = @id_product);
	set @total_rate = (select count(*) from rate where id = @id_product);
	
	declare @rate_avg float;
	set @rate_avg = @sum_of_rate / @total_rate;
	update product set rate = round(@rate_avg,0) where id = @id_product;
end

set dateformat dmy
insert into product([name], categories, [description], dev, fee, downloadcount, size, isApproved, release) values 
	('Facebook', 1, N'Cập nhật thông tin từ bạn bè nhanh chóng hơn bao giờ hết.','Meta Platforms, Inc.',0,500000000,2.1,1, '18/05/2022'),
	('TikTok', 1, 'We make it easy for you to discover and create your own original videos by providing easy-to-use tools to view and capture your daily moments. Take your videos to the next level with special effects, filters, music, and more.','TikTok Pte. Ltd.',0,100000000,3.1,1,'18/05/2022'),
	('Messenger', 1, N'Kết nối với bạn bè trên Instagram ngay từ Messenger. Chỉ cần tìm kiếm họ theo tên hoặc tên người dùng để nhắn tin hay gọi điện.','Meta Platforms, Inc.',0,500000000,3.2,1,'18/05/2022'),
	('Twitter', 1, 'Join the conversation!.','Twitter, Inc.',0,100000000,2.5,1,'18/05/2022'),
	('Spotify', 1, N'Nghe nhạc thả phanh cùng Spotify, dịch vụ truyền phát nhạc trực tuyến miễn phí hàng đầu thế giới, để thăng hoa tâm hồn không giới hạn.','Spotify AB',0,100000000,2.9,1,'18/05/2022'),
	('Netflix', 1, N'Bạn đang tìm những bộ phim và chương trình truyền hình đang gây sốt nhất trên thế giới? Chúng đều có tại Netflix.','Netflix, Inc.',0,100000000,3.5,1,'18/05/2022'),
	('Zoom', 1, 'Stay connected wherever you go – start or join a secure meeting with flawless video and audio, instant screen sharing, and cross-platform instant messaging - for free!','zoom.us',0,5000000,162,1,'18/05/2022'),
	('Discord', 1, N'Discord là nơi bạn có thể tạo ra một ngôi nhà cho cộng đồng và bạn bè của mình. Nơi bạn giữ liên lạc và giao lưu qua trò chuyện tin nhắn, trò chuyện thoại và video.','Discord Inc.',0,1000000,106,1,'18/05/2022'),
	('Genshin Impact', 0, N'Lục địa Teyvat rộng lớn, nơi vô số sinh vật sinh sôi và hội tụ.Đây chính là thế giới do bảy vị Thần thống trị, cũng là nơi bảy loại nguyên tố tụ hội...','COGNOSPHERE PTE.',0,50000000,349,1,'18/05/2022'),
	('Township', 0, 'Build your dream town! Harvest crops at the farms, process them at your facilities, and sell goods to develop your town','Playrix',0,100000000,137,1,'18/05/2022'),
	('Minecraft', 0, 'Explore infinite worlds and build everything from the simplest of homes to the grandest of castles.','Mojang',180000,1000000,150,1,'18/05/2022'),
	('Fruit Ninja Classic', 0, 'Slice fruit, don’t slice bombs – that is all you need to know to get started with the addictive Fruit Ninja action!','Halfbrick Studios',22000,1000000,190,1,'18/05/2022')

insert into rate values (1, 1, N'Tôi đã cài xác nhận 2 yếu tố nhưng tôi quên mã đăng nhập bây giờ gửi mã qua SMS thì không gửi thì sao tôi vào được acc?Mong Facebook xem được và sửa lỗi ạ(Tôi thành thật cảm ơn)')
insert into rate values(1, 4, N'Đề nghị Facebook có thêm tính năng chặn quảng cáo mà mình không thích xem nhất là bán hàng lừa đảo. Cứ vào trang cá nhân là quảng cáo láo lên đầy ẩn không có tác dụng vậy là sao.')
insert into rate values(1, 5, N'Nó giúp tôi gặp gỡ và làm quen đc nhiều bạn bè hơn')
insert into rate values(2, 5, N'cảm ơn Tiktok đã Tạo cơ hội cho chúng chúng tôi kết nối bạn bè trên toàn thế giới.')
insert into rate values(2, 4, N'Rất thú vị Tiktok đã tạo cho tôi được niềm vui sau những ngày làm việc mệt mỏi')
insert into rate values(3, 4, N'Mình đang dùng oppo a5 2020 mà đôi lúc vẫn bị giật lag hi vọng app sẽ tối ưu hơn trong tương lai :)))')
insert into rate values(3, 5, N'yêu cầu cập nhật tính năng mới càng sớm càng tốt. có vài ng đến h vẫn ch đc cập nhật')
insert into rate values(4, 5, N' I LOVE YOU cảm ưng app tuyệt zời')
insert into rate values(4, 1, N'Sao khi cập nhật thì toàn bị lỗi , vào trang cá nhân lướt đc vài bài thì lại bị văng ra :))')
insert into rate values(5, 1, N'Quá nhiều quảng cáo, ứng dụng chỉ muốn moi tiền ng dùng, muốn nghe nhạc trong mục yêu thích hay playlist thì toàn bị nhảy sang mấy bài vớ vẩn')
insert into rate values(5, 5, N'Tôi rất thích ứng dụng này thật tuyệt vời rất thích hợp với những ai muốn thư giãn')
insert into rate values(6, 5, N'Mình sẽ đề xuất người thân dùng Netflix. I will recommend my relatives to use Netflix.')
insert into rate values(6, 1, N'Ko đăng nhập đc mặc dù thử lại rất nhiều lần')
insert into rate values(7, 5, N'Ứng dụng này rất hay nhưng trên điện thoại không có cái chức năng là màn hình ảo tôi mong hãy cho màn hình ảo vào zoom trên điện thoại. Xin cảm ơn.')
insert into rate values(7, 5, N'Các bạn ơi các bạn nếu mà ai học Zoom thì tải cái app này về đi nó rất là và rất tốt các bạn có thể học ở bất cứ nơi đâu mà mình muốn ❤️♥️ mình rất yêu thích')
insert into rate values(8, 4, N'Ứng dụng khá hay, nhiều tính năng, ít lag và ta có thể call lúc nào cx đc với những con bot thú vị.')
insert into rate values(8, 5, N'Hay nhưng nhìn sơ lược thì đa số bài đánh giá không khả quan cho mấy nhưng chủ yếu là thành phần không biết sài nên chấm 1* app hay mọi người nên tải nếu không thì trên laptop hoặc pc cũng có')
insert into rate values(9, 5, N'Game thực sự tuyệt vời. tôi chỉ muốn game ra nhiều sự kiện và tối ưu game đồ hoạ mượt hơn xíu chứ snap835 ram 6gb hơi ₫uối;)')
insert into rate values(9, 5, N'Máy mình lúc trước game 8GB chơi không được mà giờ lên 15GB lại chơi được chứng tỏ nhà phát triển đã tối ưu hóa trò chơi rất tốt')
insert into rate values(10, 5, N'U là trời không tin là một cái game mà mình chơi lâu nhất luôn bỏ tgian xong vẫn vô chơi tiếp. Các bạn nên chơi nhé game vui lắm')
insert into rate values(10, 5, N'Game này chính tuổi thơ tôi, với đồ họa quen thuộc, dễ thương mang lại cảm giác thoải mái, dễ chịu')
insert into rate values(11, 5, N'game vui chỉ có điều là game rất đắt nhưng game giúp các bn nhỏ giải thỏa sau một này đi học mệt mỏi mấy bn cho bao nhiêu sao chứ tui cho 5 sao.')
insert into rate values(11, 5, N'Game rất hay nhưng chơi hơi bị giật, lác chút và game mua hơi đắt tiền tôi mong nhà phát hành giảm giá tiền một chút được không chứ đắt quá.')
insert into rate values(12, 5, N'Nếu để tần số quét màn hình là 60hz thì chơi bình thường. Nhưng khi chỉnh tần số lên 120hz thì tốc độ trái cây bay lẫn thời gian đếm ngược đều nhanh x2 lần. Làm ơn sửa lại lỗi này please!!!')
insert into rate values(12, 5, N'Game hay lắm ạ..bản này tốt và nhẹ hơn bản free nha')
insert into rate values(12, 5, N'Đã mua và chơi thử, thật sự game rất hay.')

insert into Account(username, [password], isdev, isadmin, isBlocked) values ('admin','123456', 0, 1, 0)
insert into Account(username, [password], isdev, isadmin, isBlocked) values ('dev','123456', 1, 0, 0)
insert into Account(username, [password], isdev, isadmin, isBlocked) values ('jungjung','123456', 0, 0, 0)
insert into Account(username, [password], isdev, isadmin, isBlocked) values ('khangle','123456', 0, 0, 0)

insert into Userinfo(id, username, fullname) values (1, 'admin','admin')
insert into Userinfo(id, username, fullname, [money]) values (2, 'dev','dev', 0)
insert into Userinfo(id, username, fullname, dob, [address], phone, mail, [money]) values (3, 'jungjung', N'Mong Van Dung', '2001-01-26', 'TPHCM', '0911710056', 'jungjung.now@gmail.com', 0)
insert into Userinfo(id, username, fullname, dob, [address], phone, mail, [money]) values (4, 'khangle', N'Le Ho Bao Khang', '2001-11-26', 'TPHCM', '0389341740', 'khangbayern4869@gmail.com', 0)