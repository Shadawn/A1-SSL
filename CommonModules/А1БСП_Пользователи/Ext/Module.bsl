﻿Функция НастройкиМеханизма() Экспорт
	Настройки = А1Э_Механизмы.НовыйНастройкиМеханизма();
	
	Настройки.Обработчики.Вставить("А1Э_ПриПолученииОсновногоСписка", Истина);
	
	Возврат Настройки;
КонецФункции

Функция А1Э_ПриПолученииОсновногоСписка(Форма, ОсновнойСписок) Экспорт
	Если А1Э_Формы.ТипФормы(Форма) = "ФормаСписка" Тогда
		ОсновнойСписок = Форма.Элементы.Найти("ПользователиСписок");
	КонецЕсли;
КонецФункции