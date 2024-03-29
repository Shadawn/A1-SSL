﻿Функция НастройкиМеханизма() Экспорт
	Настройки = А1Э_Механизмы.НовыйНастройкиМеханизма();
	
	Настройки.Обработчики.Вставить("ПередЗаписью", Истина);
	Настройки.Обработчики.Вставить("А1Э_ПриОбновленииРасширений", Истина);
	
	Возврат Настройки;
КонецФункции

#Если НЕ Клиент Тогда
	
	Функция ПередЗаписью(Объект, Отказ) Экспорт
		ЗаполнитьИмяПредопределенногоНабора(Объект);
		ЗаполнитьВладельцевДляОбъектовСМеханизмом(Объект);			
	КонецФункции
	
	Функция ЗаполнитьИмяПредопределенногоНабора(Объект)
		Если Объект.ИмяПредопределенногоНабора <> "" Тогда Возврат Неопределено; КонецЕсли;
		Если Объект.ИмяПредопределенныхДанных <> "" Тогда
			Объект.ИмяПредопределенногоНабора = Объект.ИмяПредопределенныхДанных;
		КонецЕсли;
	КонецФункции
	
	Функция ЗаполнитьВладельцевДляОбъектовСМеханизмом(Объект)
		МетаданныеОбъекта = Объект.Метаданные();
		Для Каждого Реквизит Из МетаданныеОбъекта.Реквизиты Цикл
			Если НЕ СтрЗаканчиваетсяНа(Реквизит.Имя, "_Владелец") Тогда Продолжить; КонецЕсли;
			Значение = Объект[Реквизит.Имя];
			Если МетаданныеОбъекта.ТабличныеЧасти.ДополнительныеРеквизиты.Реквизиты.Найти(Реквизит.Имя) <> Неопределено Тогда
				Для Каждого Строка Из Объект.ДополнительныеРеквизиты Цикл
					Строка[Реквизит.Имя] = Значение;
				КонецЦикла;
			КонецЕсли;
				Если МетаданныеОбъекта.ТабличныеЧасти.ДополнительныеСведения.Реквизиты.Найти(Реквизит.Имя) <> Неопределено Тогда
				Для Каждого Строка Из Объект.ДополнительныеСведения Цикл
					Строка[Реквизит.Имя] = Значение;
				КонецЦикла;
			КонецЕсли;
		КонецЦикла;
	
	КонецФункции
	
	Функция А1Э_ПриОбновленииРасширений(Обновления) Экспорт 
		//Почему-то типовые предопределенные наборы не хотят использовать реквизит ИмяПредопределенногоНабора, а нам очень пригождается.
		Если А1Обновление_Расширения.НужноОбработать(Обновления, "А1БСП", "2022-06-06") Тогда
			Выборка = А1Э_Запросы.Выбрать(
			"ВЫБРАТЬ
			|	Наборы.Ссылка КАК Ссылка
			|ИЗ
			|	Справочник.НаборыДополнительныхРеквизитовИСведений КАК Наборы
			|ГДЕ
			|	Наборы.ИмяПредопределенногоНабора = """"");
			Пока Выборка.Следующий() Цикл
				НаборОбъект = Выборка.Ссылка.ПолучитьОбъект();
				НаборОбъект.Записать();
			КонецЦикла;	
		КонецЕсли;
	КонецФункции
	
#КонецЕсли
