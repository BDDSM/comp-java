﻿
///////////////////////////////////////////////////////////////////////////////
// ОБРАБОТЧИКИ СОБЫТИЙ ФОРМЫ

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	JAVA_HOME = КомпонентыJavaВызовСервера.ПолучитьJAVA_HOME();
	
	Список.Параметры.УстановитьЗначениеПараметра("Ссылки", КомпонентыJava.УстановленныеКомпоненты());
	
КонецПроцедуры

#КонецОбласти


///////////////////////////////////////////////////////////////////////////////
// ОБРАБОТЧИКИ СОБЫТИЙ ЭЛЕМЕНТОВ ФОРМЫ

#Область ОбработчикиСобытийЭлементовФормы

&НаКлиенте
Процедура JAVA_HOMEНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	Оповещение = Новый ОписаниеОповещения("ПослеВыбораJRE", ЭтаФорма);	
	
	ОткрытьФорму("Справочник.КомпонентыJava.Форма.ВыборJRE",
		Новый Структура("JAVA_HOME", Элемент.ТекстРедактирования), 
		, 
		, 
		, 
		, 
		Оповещение);
	
КонецПроцедуры

&НаКлиенте
Процедура JAVA_HOMEОчистка(Элемент, СтандартнаяОбработка)
	
	КомпонентыJavaВызовСервера.УстановитьJAVA_HOME("");
	
КонецПроцедуры

#КонецОбласти


///////////////////////////////////////////////////////////////////////////////
// СЛУЖЕБНЫЕ ПРОЦЕДУРЫ И ФУНКЦИИ

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ПослеВыбораJRE(Результат, ДополнительныеПараметры) Экспорт
	
	Если ЗначениеЗаполнено(Результат) Тогда
		JAVA_HOME = Результат;		
		КомпонентыJavaВызовСервера.УстановитьJAVA_HOME(Результат);
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти