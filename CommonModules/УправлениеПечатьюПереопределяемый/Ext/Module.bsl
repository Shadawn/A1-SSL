﻿//Необходимо для механизма "А1БСП_ПодключаемыеКоманды"
&После("ПриОпределенииОбъектовСКомандамиПечати")
Процедура А1БСП_ПриОпределенииОбъектовСКомандамиПечати(СписокОбъектов)
	А1БСП_ПодключаемыеКоманды.ПриОпределенииОбъектовСКомандамиПечати(СписокОбъектов);
КонецПроцедуры

//Подключение обработчика "А1БСП_ПриДобавленииКомандПечати"
&После("ПередДобавлениемКомандПечати")
Процедура А1БСП_ПередДобавлениемКомандПечати(ИмяФормы, КомандыПечати, СтандартнаяОбработка)
	Если Метаданные.ОбщиеМодули.Найти("А1Э_Механизмы") <> Неопределено Тогда
		А1Э_Механизмы.ВыполнитьМеханизмыОбработчикаОбъекта("А1БСП_ПриДобавленииКомандПечати", ИмяФормы, КомандыПечати);	
	КонецЕсли;
КонецПроцедуры
