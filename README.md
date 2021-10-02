# BRAND_MYSQL

  В качестве курсового проекта планирую создание базы магазина одежды.
  Выбор связан  с созданием, для размещения в портфолио, работ на основе макета "BRAND".
  База должна содержать сведения о:
    1) зарегистрированном пользователе;
    2) товаре;
    3) заказе;
    4) отзывах посетителей.
  Таблица пользователей, исходя из макета содержит сведения:
    1) имя;
    2) фамилия;
    3) пол;
    4) адрес электронной почты;
    5) пароль.
  Сведения о пользователе можно хранить в одной таблице и она будет соответствовать требованиям третьей форме.
  Информация о товаре должна включать: артикул, название, бренд, вид товара, категория товара, цвет товара, 
  размер, фото, количество, описание товара, цену, скидку, количество на складе и отзыв.
  Информация о товаре содержит много сведений и один и тот же товар может, к примеру, иметь разный цвет, размер. 
  Бренд может иметь несколько видов товара. 
  В связи с чем информация о товаре будет содержаться в нескольких таблицах:
    1) таблица с перечислением названий брендов;
    2) таблица размеров товара;
    3) таблица цветов товара;
    4) таблица категорий товара (мужская, женская, детская);
    5) таблица видов одежды (брюки, платья, кофты...);
    6) таблица фотографий (картинок) товара;
    7) таблица количества товаров.
  В таблице товара соответственно будет содержаться артикул, название продукта, описание товара, цену, а также ссылки на внешние ключи описаных выше таблиц.
  Сведения о заказе составят таблицу содержащую в себе информацию о товаре (ссылка на внешний ключ) и информацию о пользователе (ссылка на внешний ключ), 
  количество приобретенного товара, дате заказа, а так же адрес доставки.
  Отзывы важная часть рекламы, поэтому они должны быть как о работе магазина в целом, так и о продаваемом продукте.
  Первая таблица будет содержать информацию о пользователе (ссылка на внешний ключ) и текст сообщения.
  Вторая - информацию о пользователе (ссылка на внешний ключ), информацию о товаре (ссылка на внешний ключ) и текст сообщения.  
