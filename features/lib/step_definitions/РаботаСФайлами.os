#Использовать 1bdd

Перем БДД; //контекст фреймворка 1bdd

// Метод выдает список шагов, реализованных в данном файле-шагов
Функция ПолучитьСписокШагов(КонтекстФреймворкаBDD) Экспорт
	
	БДД = КонтекстФреймворкаBDD;

	ВсеШаги = Новый Массив;
	ВсеШаги.Добавить("СодержимоеФайлаРавноСодержимомуФайла");

	Возврат ВсеШаги;
	
КонецФункции

// Реализация шагов

// содержимое файла "./build/OpenAPI.json" равно содержимому файла "<КаталогПроекта>/tests/fixtures/OpenAPI.json"
Процедура СодержимоеФайлаРавноСодержимомуФайла(Знач РезультатПутьКФайлу, Знач ЭталонПутьКФайлу) Экспорт

	РезультатПутьКФайлу = ЗаменитьШаблоныВПараметрахКоманды(РезультатПутьКФайлу);
	ЭталонПутьКФайлу = ЗаменитьШаблоныВПараметрахКоманды(ЭталонПутьКФайлу);

	ЧтениеТекстаРезультат = Новый ЧтениеТекста(РезультатПутьКФайлу, КодировкаТекста.UTF8NoBOM);
	СодержимоеФайлаРезультат = ЧтениеТекстаРезультат.Прочитать();
	ЧтениеТекстаРезультат.Закрыть();

	ЧтениеТекстаЭталон = Новый ЧтениеТекста(ЭталонПутьКФайлу, КодировкаТекста.UTF8NoBOM);
	СодержимоеФайлаЭталон = ЧтениеТекстаЭталон.Прочитать();
	ЧтениеТекстаЭталон.Закрыть();

	Ожидаем.Что(СодержимоеФайлаРезультат).Равно(СодержимоеФайлаЭталон);

КонецПроцедуры

Функция ЗаменитьШаблоныВПараметрахКоманды(Знач ПараметрыКоманды)
	Рез = СтрЗаменить(ПараметрыКоманды, "<КаталогПроекта>", БДД.КаталогПроверяемогоПроекта());
	Рез = СтрЗаменить(Рез, "<РабочийКаталог>", БДД.ПолучитьИзКонтекста("РабочийКаталог"));
	Возврат Рез;
КонецФункции
