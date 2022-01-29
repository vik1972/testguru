# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
  categories = Category.create!([
   {id: 0, title: "Начальный"}, 
   {id: 1, title: "Базовый"}, 
   {id: 2, title: "Сложный"}
  ])

  users = User.create!([
    {name: "Михаил", surname: "Петров", admin: true},
    {name: "Сергей", surname: "Иванов"},
    {name: "Илья", surname: "Сергеев"},
    {name: "Маша", surname: "Петрова", admin: true},
  ])

  tests = Test.create!([
    {title: "Логические операции", level: 1, category_id: categories[1].id, author_id: users[0].id }, 
    {title: "Информация и информационные процессы", category_id: categories[0].id, author_id: users[0].id }, 
    {title: "Устройства ввода", category_id: categories[0].id, author_id: users[0].id }, 
    {title: "Компьютерные сети", level:1, category_id: categories[1].id, author_id: users[3].id }
  ]) 

  questions = Question.create!([
    {body: "Какой ученый разработал основы алгебры логики?", 
      test_id: tests[0].id},
    {body: "Какая операция называется «дизъюнкцией»?",
      test_id: tests[0].id},
    {body: "Как называется операция, соответствующая связке «тогда и только тогда»?",
      test_id: tests[0].id},
    {body: "Как называется операция, соответствующая связке «если ... то»?",
      test_id: tests[0].id},

    {body: "Что изучает информатика?",
      test_id: tests[1].id},
    {body: "Отметьте виды информации, которые компьютер пока не умеет обрабатывать.",
      test_id: tests[1].id},
    {body: "Выберите процессы, которые можно назвать обработкой информации.",
      test_id: tests[1].id},
    {body: "Какая фраза может служить определением сортировки?",
      test_id: tests[1].id},

    {body: "Какой способ обмена данными используется при вводе с клавиатуры?",
      test_id: tests[2].id},
    {body: "В каких единицах обычно измеряется разрешение оптического сенсора мыши?",
      test_id: tests[2].id},
    {body: "Выберите минимальное разрешение сканера, достаточное для распознавания отсканированного текста.",
      test_id: tests[2].id},
    {body: "Что необходимо для ввода звука в компьютер?",
      test_id: tests[2].id},

    {body: "Отметьте средства, с помощью которых могут передаваться данные в компьютерной сети.",
      test_id: tests[3].id},
    {body: "Что необходимо для объединения компьютеров в локальную сеть?",
      test_id: tests[3].id},
    {body: "Какие задачи возлагаются на системного администратора?",
      test_id: tests[3].id},
    {body: "Какие преимущества мы получаем, объединив компьютеры в сеть?",
      test_id: tests[3].id}
  ])

  answers = Answer.create!([
    #"Логические операции"
    {body: "Л. Пастер", value: 0, correct: false, question_id: questions[0].id},
    {body: "Дж. Буль", value: 1, correct: true, question_id: questions[0].id},
    {body: "К. Шеннон", value: 0, correct: false, question_id: questions[0].id},

    {body: "И", value: 0, question_id: questions[1].id},
    {body: "НЕ", value: 0, question_id: questions[1].id},
    {body: "ИЛИ", value: 1, correct: true, question_id: questions[1].id},

    {body: "эквивалентность", value: 1, correct: true, question_id: questions[2].id},
    {body: "дизъюнкция", value: 0, question_id: questions[2].id},
    {body: "импликация", value: 0, question_id: questions[2].id},
  
    {body: "дизъюнкция", value: 0, question_id: questions[3].id},
    {body: "импликация", value: 1, correct: true, question_id: questions[3].id},
    {body: "эквивалентность", value: 0, question_id: questions[3].id},

    #"Информация и информационные процессы"
    {body: "любые процессы и явления, связанные с информацией", value: 0.5, correct: true, question_id: questions[4].id},
    {body: "программирование для компьютеров", value: 0.5, correct: true, question_id: questions[4].id},
    {body: "взаимосвязь явлений в природе", value: 0,  question_id: questions[4].id},

    {body: "запах", value: 0.5, correct: true, question_id: questions[5].id},
    {body: "вкус", value: 0.5, correct: true, question_id: questions[5].id},
    {body: "речь человека", value: 0, question_id: questions[5].id},
    
    {body: "шифрование", value: 1, correct: true, question_id: questions[6].id},
    {body: "передача информации", value: 0, question_id: questions[6].id},
    {body: "хранение данных", value: 0, question_id: questions[6].id},

    {body: "выбор нужных элементов", value: 0, question_id: questions[7].id},
    {body: "расстановка элементов списка в заданном порядке", value: 1, correct: true, question_id: questions[7].id},
    {body: "изменение порядка элементов", value: 0, question_id: questions[7].id},

    #"Устройства ввода"
    {body: "программно-управляемый обмен данными", value: 0, question_id: questions[8].id},
    {body: "обмен по прерываниям", value: 1, correct: true, question_id: questions[8].id},
    {body: "прямой доступ к памяти", value: 0, question_id: questions[8].id},

    {body: "точки на дюйм (dpi)", value: 1, correct: true, question_id: questions[9].id},
    {body: "пиксели на дюйм (ppi)", value: 0, question_id: questions[9].id},
    {body: "точки на сантиметр", value: 0, question_id: questions[9].id},

    {body: "200 ppi", value: 0, question_id: questions[10].id},
    {body: "300 ppi", value: 1, correct: true, question_id: questions[10].id},
    {body: "600 ppi", value: 0, question_id: questions[10].id},

    {body: "звуковая карта", value: 0.5, correct: true, question_id: questions[11].id},
    {body: "быстродействующий процессор", value: 0, question_id: questions[11].id},
    {body: "микрофон", value: 0.5, correct: true, question_id: questions[11].id},

    #"Компьютерные сети"
    {body: "радиоволны", value: 0.5, correct: true, question_id: questions[12].id},
    {body: "телефонные каналы связи", value: 0.5, correct: true, question_id: questions[12].id},
    {body: "воздух", value: 0, question_id: questions[12].id},

    {body: "сетевые устройства на каждом компьютере", value: 1, correct: true, question_id: questions[13].id},
    {body: "программное обеспечение для обмена данными по сети", value: 0.5, correct: true, question_id: questions[13].id},
    {body: "наличие выделенного компьютера-сервера", value: 0, question_id: questions[13].id},

    {body: "разграничение прав пользователей", value: 0.5, correct: true, question_id: questions[14].id},
    {body: "разработка программного обеспечения", value: 0, question_id: questions[14].id},
    {body: "резервное копирование данных", value: 0.5, correct: true, question_id: questions[14].id},

    {body: "совместное использование внешних устройств", value: 0.5, correct: true, question_id: questions[15].id}, 
    {body: "повышение защиты данных", value: 0, question_id: questions[15].id}, 
    {body: "упрощение обмена данными", value: 0.5, correct: true, question_id: questions[15].id}
  ]) 

  PassedTest.create!([
    {user_id: 1, test_id: 1, score: 10, date: '2021-10-08'},
    {user_id: 1, test_id: 2, score: 8.5, date: '2021-10-18'},
    {user_id: 1, test_id: 3, score: 4.25, date: '2021-10-20'},
    {user_id: 2, test_id: 1, score: 10, date: '2021-10-11'},
    {user_id: 2, test_id: 2, score: 6, date: '2022-01-10'},
    {user_id: 1, test_id: 4, score: 8, date: '2022-01-21'},
    {user_id: 2, test_id: 4, score: 6, date: '2022-01-24'}
  ])