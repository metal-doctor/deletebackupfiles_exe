#Использовать logos
#Использовать "..\deletebackupfiles"

Перем Лог;

Функция Форматировать(Знач Уровень, Знач Сообщение) Экспорт

    Возврат СтрШаблон("%1: %2 - %3", Формат(ТекущаяДата(), "ДФ='dd.MM.yyyy HH:mm:ss'"), УровниЛога.НаименованиеУровня(Уровень), Сообщение);
	
КонецФункции

Процедура ЗадатьНачальныеНастройки()
	
	Лог = Логирование.ПолучитьЛог("app.test.messages");
	Лог.УстановитьУровень(УровниЛога.Информация);
	// Лог.УстановитьУровень(УровниЛога.Отладка);
	ФайлЖурнала = Новый ВыводЛогаВФайл();
	ФайлЖурнала.ОткрытьФайл("app.test.messages.log");
	Лог.ДобавитьСпособВывода(ФайлЖурнала);
	Лог.ДобавитьСпособВывода(Новый ВыводЛогаВКонсоль());
	Лог.УстановитьРаскладку(ЭтотОбъект);

КонецПроцедуры

ЗадатьНачальныеНастройки();

Лог.Информация("Начало");

Попытка
	//ф = 4 / 0;
	НайденныеФайлы = НайтиФайлы(Неопределено, "*");
	Сообщить("НайденныеФайлы: "+НайденныеФайлы.Количество());
Исключение
	ИнформацияОбОшибке = ИнформацияОбОшибке();
	
	Лог.Ошибка("Ошибка удаления устаревших резервных копий!");
	Лог.Ошибка(ПодробноеПредставлениеОшибки(ИнформацияОбОшибке));
КонецПопытки;

Лог.Информация("Конец");