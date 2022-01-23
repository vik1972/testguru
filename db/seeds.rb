# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
  Category.create([
    {id: 0, title: "Начальный"}, 
    {id: 1, title: "Базовый"}, 
    {id: 2, title: "Сложный"}
  ]) 

  Test.create([
    {id: 1, title: "Логические операции", level: 1, category_id: 1}, 
    {id: 2, title: "Информация и информационные процессы", category_id: 0}, 
    {id: 3, title: "Устройства ввода", category_id: 0}, 
    {id: 4, title: "Компьютерные сети", level:1, category_id: 1}
  ]) 

  Question.create([
    {body: "Какой ученый разработал основы алгебры логики?", 
      test_id: 1},
    {body: "Какая операция называется «дизъюнкцией»?",
      test_id: 1},
    {body: "Как называется операция, соответствующая связке «тогда и только тогда»?",
      test_id: 1},
    {body: "Как называется операция, соответствующая связке «если ... то»?",
      test_id: 1},

    {body: "Что изучает информатика?",
      test_id: 2},
    {body: "Отметьте виды информации, которые компьютер пока не умеет обрабатывать.",
      test_id: 2},
    {body: "Выберите процессы, которые можно назвать обработкой информации.",
      test_id: 2},
    {body: "Какая фраза может служить определением сортировки?",
      test_id: 2},

    {body: "Какой способ обмена данными используется при вводе с клавиатуры?",
      test_id: 3},
    {body: "В каких единицах обычно измеряется разрешение оптического сенсора мыши?",
      test_id: 3},
    {body: "Выберите минимальное разрешение сканера, достаточное для распознавания отсканированного текста.",
      test_id: 3},
    {body: "Что необходимо для ввода звука в компьютер?",
      test_id: 3},

    {body: "Отметьте средства, с помощью которых могут передаваться данные в компьютерной сети.",
      test_id: 4},
    {body: "Что необходимо для объединения компьютеров в локальную сеть?",
      test_id: 4},
    {body: "Какие задачи возлагаются на системного администратора?",
      test_id: 4},
    {body: "Какие преимущества мы получаем, объединив компьютеры в сеть?",
      test_id: 4}
  ])

  Answer.create([
    #"Логические операции"
    {body: "Л. Пастер", value: 0, correct: false, question_id: 1},
    {body: "Дж. Буль", value: 1, correct: true, question_id: 1},
    {body: "К. Шеннон", value: 0, correct: false, question_id: 1},

    {body: "И", value: 0, question_id: 2},
    {body: "НЕ", value: 0, question_id: 2},
    {body: "ИЛИ", value: 1, correct: true, question_id: 2},

    {body: "эквивалентность", value: 1, correct: true, question_id: 3},
    {body: "дизъюнкция", value: 0, question_id: 3},
    {body: "импликация", value: 0, question_id: 3},
  
    {body: "дизъюнкция", value: 0, question_id: 4},
    {body: "импликация", value: 1, correct: true, question_id: 4},
    {body: "эквивалентность", value: 0, question_id: 4},

    #"Информация и информационные процессы"
    {body: "любые процессы и явления, связанные с информацией", value: 0.5, correct: true, question_id: 5},
    {body: "программирование для компьютеров", value: 0.5, correct: true, question_id: 5},
    {body: "взаимосвязь явлений в природе", value: 0,  question_id: 5},

    {body: "запах", value: 0.5, correct: true, question_id: 6},
    {body: "вкус", value: 0.5, correct: true, question_id: 6},
    {body: "речь человека", value: 0, question_id: 6},
    
    {body: "шифрование", value: 1, correct: true, question_id: 7},
    {body: "передача информации", value: 0, question_id: 7},
    {body: "хранение данных", value: 0, question_id: 7},

    {body: "выбор нужных элементов", value: 0, question_id: 8},
    {body: "расстановка элементов списка в заданном порядке", value: 1, correct: true, question_id: 8},
    {body: "изменение порядка элементов", value: 0, question_id: 8},

    #"Устройства ввода"
    {body: "программно-управляемый обмен данными", value: 0, question_id: 9},
    {body: "обмен по прерываниям", value: 1, correct: true, question_id: 9},
    {body: "прямой доступ к памяти", value: 0, question_id: 9},

    {body: "точки на дюйм (dpi)", value: 1, correct: true, question_id: 10},
    {body: "пиксели на дюйм (ppi)", value: 0, question_id: 10},
    {body: "точки на сантиметр", value: 0, question_id: 10},

    {body: "200 ppi", value: 0, question_id: 11},
    {body: "300 ppi", value: 1, correct: true, question_id: 11},
    {body: "600 ppi", value: 0, question_id: 11},

    {body: "звуковая карта", value: 0.5, correct: true, question_id: 12},
    {body: "быстродействующий процессор", value: 0, question_id: 12},
    {body: "микрофон", value: 0.5, correct: true, question_id: 12},

    #"Компьютерные сети"
    {body: "радиоволны", value: 0.5, correct: true, question_id: 13},
    {body: "телефонные каналы связи", value: 0.5, correct: true, question_id: 13},
    {body: "воздух", value: 0, question_id: 13},

    {body: "сетевые устройства на каждом компьютере", value: 1, correct: true, question_id: 14},
    {body: "программное обеспечение для обмена данными по сети", value: 0.5, correct: true, question_id: 14},
    {body: "наличие выделенного компьютера-сервера", value: 0, question_id: 14},

    {body: "разграничение прав пользователей", value: 0.5, correct: true, question_id: 15},
    {body: "разработка программного обеспечения", value: 0, question_id: 15},
    {body: "резервное копирование данных", value: 0.5, correct: true, question_id: 15},

    {body: "совместное использование внешних устройств", value: 0.5, correct: true, question_id: 16}, 
    {body: "повышение защиты данных", value: 0, question_id: 16}, 
    {body: "упрощение обмена данными", value: 0.5, correct: true, question_id: 16}
  ]) 

  User.create([
    {name: "Михаил", surname: "Петров", test_id: 1},
    {name: "Сергей", surname: "Иванов", test_id: 1},
    {name: "Иван", surname: "Сергеев", test_id: 1},
    {name: "Михаил", surname: "Петров", test_id: 2},
    {name: "Сергей", surname: "Иванов", test_id: 2},
    {name: "Иван", surname: "Сергеев", test_id: 2},
    {name: "Михаил", surname: "Петров", test_id: 3},
    {name: "Иван", surname: "Сергеев", test_id: 3},
    {name: "Михаил", surname: "Петров", test_id: 4},
    {name: "Сергей", surname: "Иванов", test_id: 4}
  ])