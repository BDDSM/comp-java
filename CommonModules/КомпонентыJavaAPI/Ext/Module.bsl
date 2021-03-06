﻿
///////////////////////////////////////////////////////////////////////////////
// Компоненты

#Область Компоненты

// "Объект" EMailValidator
// 
// Возвращаемое значение:
//  Обработка - Объект метаданных
//
Функция EMailВалидатор() Экспорт
	
	Возврат Обработки["EMailВалидатор"].Создать();
	
КонецФункции

// "Объект" JMS-клиент
//
// Параметры:
//  URL	  - Строка - Адрес брокера
//  Логин	- Строка - Логин
//  Пароль   - Строка - Пароль
// 
// Возвращаемое значение:
//  Обработка - Объект метаданных
//
Функция JMSКлиент(Адрес = Неопределено, Логин = Неопределено, Пароль = Неопределено) Экспорт
	
	Клиент = Обработки["JMSКлиент"].Создать();
	Клиент.Адрес = Адрес;
	Клиент.Логин = Логин;
	Клиент.Пароль = Пароль;
	
	Возврат Клиент;
	
КонецФункции

// Функция - CSVОбъект
//
// Параметры:
//  Источник	 - Строка - Адрес во временном, Имя файла
//  Разделитель  - Строка - Разделитель
//  Кодировка    - ПеречислениеСсылка.Кодировки - Кодировка, по умолчанию UTF-8
// 
// Возвращаемое значение:
//  ОбработкаОбъект - Объект метаданных
//
Функция CSVОбъект(Источник = Неопределено, Разделитель = Неопределено, Кодировка = Неопределено) Экспорт
	
	Если Кодировка = Неопределено Тогда
		Кодировка = ПредопределенноеЗначение("Перечисление.Кодировки.UTF8");
	КонецЕсли;
	
	Объект = Обработки["CSVОбъект"].Создать();
	Объект.Источник = Источник;
	Объект.Разделитель = Разделитель;
	Объект.Кодировка = Кодировка;
	
	Возврат Объект;
	
КонецФункции

// "Объект" ExcelОбъект
//
// Параметры:
//  Источник	  - Строка - Адрес во временном, имя файла
//  Расширение	- Строка - Расширение файла (xls, xlsx)
// 
// Возвращаемое значение:
//  ОбработкаОбъект - ОбработкаОбъект
//
Функция ExcelОбъект(Источник = Неопределено, Расширение = Неопределено) Экспорт
	
	Объект = Обработки["ExcelОбъект"].Создать();
	Объект.Источник = Источник;
	Объект.Расширение = Расширение;
		
	Возврат Объект;
	
КонецФункции

// "Объект" SFTPОбъект
//
// Параметры:
//  Хост		 - Строка - Хост
//  Пользователь - Строка - Пользователь
//  Пароль	   - Строка - Пароль
//  Порт		 - Число - Порт
// 
// Возвращаемое значение:
//  ОбработкаОбъект - ОбработкаОбъект
//
Функция SFTPКлиент(Хост = Неопределено, Пользователь = Неопределено, Пароль = Неопределено, Порт = 22) Экспорт
	
	Объект = Обработки["SFTPКлиент"].Создать();
	Объект.Хост = Хост;
	Объект.Пользователь = Пользователь;
	Объект.Пароль = Пароль;
	Объект.Порт = Порт;
	
	Возврат Объект;
	
КонецФункции

// "Объект" RegEx
// 
// Возвращаемое значение:
//  ОбработкаОбъект - ОбработкаОбъект
//
Функция RegEx() Экспорт
	
	Возврат Обработки["RegEx"].Создать();
	
КонецФункции

// "Объект" Логгер
//
// Параметры:
//  InMemory - Булево - 
//  ИмяФайла - Строка, Неопределено - Имя файла БД
// 
// Возвращаемое значение:
//  ОбработкаОбъект - ОбработкаОбъект
//
Функция Логгер(InMemory = Ложь, Знач ИмяФайла = Неопределено) Экспорт
	
	Объект = Обработки["Логгер"].Создать();
	Объект.InMemory = InMemory;
	
	Если Не InMemory Тогда		
		Если ПустаяСтрока(ИмяФайла) Тогда
			ВызватьИсключение НСтр("ru = 'Не задано имя файла для хранения логов'");
		КонецЕсли;
		Объект.ИмяФайла = ИмяФайла;	
	КонецЕсли;
	
	// todo: больше похоже на костыль
	Объект.Инициализировать();
		
	Возврат Объект;
	
КонецФункции

// Объект "SQLОбъект"
//
// Параметры:
//  ПараметрыПодключения - Структура - см. Обработки.SQLОбъект.Подключение_*
// 
// Возвращаемое значение:
//  ОбработкаОбъект - ОбработкаОбъект
//
Функция SQLОбъект(ПараметрыПодключения) Экспорт
	
	Клиент = Обработки["SQLОбъект"].Создать();
	Клиент.ПодключениеJSON = КомпонентыJava.ОбъектВJSON(ПараметрыПодключения);	
	
	Возврат Клиент;
	
КонецФункции

// "Объект" SFTPОбъект
//
// Параметры:
//  Хост		 - Строка - Хост
//  Пользователь - Строка - Пользователь
//  Пароль	   - Строка - Пароль
//  Порт		 - Число - Порт
// 
// Возвращаемое значение:
//  ОбработкаОбъект - ОбработкаОбъект
//
Функция SSHКлиент(Хост = Неопределено, Пользователь = Неопределено, Пароль = Неопределено, Порт = 22) Экспорт
	
	Объект = Обработки["SSHКлиент"].Создать();
	Объект.Хост = Хост;
	Объект.Пользователь = Пользователь;
	Объект.Пароль = Пароль;
	Объект.Порт = Порт;
	
	Возврат Объект;
	
КонецФункции

// "Объект" LDAPКлиент
//
// Параметры:
//  Хост		 - 	 - 
//  Пользователь - 	 - 
//  Пароль		 - 	 - 
//  Порт		 - 	 - 
// 
// Возвращаемое значение:
//   - 
//
Функция LDAPКлиент(Хост = Неопределено, Пользователь = Неопределено, Пароль = Неопределено, Порт = 389,
	Домен = Неопределено, ВидLDAP = Неопределено) Экспорт
	
	Объект = Обработки["LDAPКлиент"].Создать();
	Объект.Хост = Хост;
	Объект.Пользователь = Пользователь;
	Объект.Пароль = Пароль;
	Объект.Порт = Порт;
	Объект.Домен = Домен;
	Объект.ВидLDAP = ВидLDAP;
	
	Возврат Объект;
	
КонецФункции

#КонецОбласти