HELLO_TXT:
; db "012345678901234567890123456789012345678901"
  db " CELL 3326       v1.2.1        22.03.2023 "
  db "------------------------------------------"
  db "Привет мир! Я хочу поиграть с тобой в одну"
  db "игру. Сюжет банален - герой, потерявший", 13
  db "память, просыпается на кровати в комнате.", 13
  ; db "------------------------------------------"
  ; db 13
  db "-----------[Управление в игре]------------"
  ; db "Управление в игре:                        "
  db "Кнопки курсора,QAOP-передвижение", 13
  db "Enter,Space,M - кнопки действия на место",13
  db "прямо перед персонажем тем предметом,кото-"
  db "рый находится в руках.", 13
  db "G-выход в меню и рестарт игры", 13
  db "------------------------------------------"
  db "Код Wanderer,музыка AER,графика взята из", 13
  db "игр LaserSquad,Stalker,Monstrland", 13
  db "------------------------------------------"
  db "Thank's to Videogames Sematary for 2-hours"
  db "game stream video, Shiru for operative and"
  db "detailed information about the beeproblem "
  db "sound and Modern ZX-Retro Gaming Channel  "
  db "for walkthrough video..",13
  db "------------------------------------------"
  db "Сайт: zxwanderer.github.io/cell3326", 13
  db "------------------------------------------"
  db _endByte

Empty_cell_name: db "ПУСТО",0
Floor_cell_name: db "Плитка",0
Door_cell_name: db "Дверь",0
Bed_cell_name: db "Кровать",0
Table_cell_name: db "Стол", 0
Computer_cell_name: db "Терминал",0
Computer_break_cell_name: db "Разбитый терминал",0
Trash_cell_name: db "Мелкие обломки и мусор",0
Trash_name: db "Мусор", 0
PDA_cell_name: db "Электронный планшет", 0
Keramit_cell_name: db "Керамит", 0
Grass_cell_name: db "Трава", 0
Bush_cell_name: db "Кустарник", 0

Gravel_cell_name: db "Гравий", 0
AirLand_cell_name: db "Посадочная площадка", 0
NavLight_cell_name: db "Навигационные огни", 0

Canister_cell_name: db "Полный биоконтейнер", 0
CanisterEmpty_cell_name: db "Пустой биоконтейнер", 0
CanisterPowered_cell_name: db "Активный биоконтейнер", 0
Generator_cell_name: db "Биотопливный реактор", 0
Nipple_cell_name: db "Патрубок для биоконтейнера", 0

Nippers_item_name: db "Кислотостойкий гидравлический резак", 0
Wrench_cell_name: db "Гаечный ключ-ломик", 0

Analyzer_cell_name: db "Анализатор", 0
Anabiose_cell_name: db "Анабиозная камера", 0
AnabioseOpen_cell_name: db "Открытая анабиозная камера", 0

ScafPlace_cell_name: db "Стойка для скафандра", 0
Scaf_cell_name: db "Легкий скафандр", 0
HardScaf_cell_name: db "Тяжелый боевой скафандр", 0

BodyTech_cell_name:
  db "Тело человека в куртке техника, видимых",13
  db "повреждений нет", 0

BodyInScaf_cell_name:
  db "Тело человека в скафандре, скафандр пробит"
  db "энергетическим оружием и непригоден." , 0

Body_cell_name:
  db "Труп человека, убит из энергетического",13
  db "оружия", 0

Soft_wall_name: db "Мягкая декоративная стена",0
Cavity_cell_name: db "Пустой короб для электроники", 0
Electronic_cell_name: db "Электронный блок управления",0
Electronic_break_name: db "Сломанная электроника", 0
Mentoscanner_cell_name: db "Ментосканнер", 0
ElectonicDestroy_cell_name: db "Обломки оборудования", 0
PlantPot_cell_name: db "Растение в горшке", 0
Wall_cell_name: db "Тяжелая бронеплита",0
WallHole_name: db "Большая дыра в стене",0

Chair_item_name: db "Стул",0
Shard_item_name: db "Острый пластиковый обломок",0

Computer_off_mess:
  db "Терминал был запаролен.Я понажимал клавиши"
  db "наугад и он отключился..", 0

Computer_off_hit_mess:
  db "Выключено..", 0

WallGrid_false_mess:
  db "Толстые прутья решетки не поддавались..",0

Soft_wall_show_electronic:
  db "Под декоративной стенкой обнаружилась     "
  db "панель управления..",0

Not_away_from_base: 
  db "Я не рискнул уходить в кислотные джунгли  "
  db "всего лишь в легком скафандре..",0

Electronic_kick_mess:
  db "Хрупкие микросхемы сломались!!",0

Electronic_kick_open_mess:
  db "Готово! Питание с двери снято.",0

Kick_fault_mess:
  db "Безрезультатно. Ничего не произошло..",0

Kick_shard_mess:
  db "Даже царапины не осталось..",0

Door_not_open_mess:
  db "Дверь не открывалась..",0

Take_bed_mess:
  db "Кровать была прикреплена к полу и не      "
  db "поднималась.. ",0

Take_trash_mess:
  db "Я подобрал из кучи обломков острый кусок  "
  db "пластика..",0

Shard_to_soft_wall_mess
  db "Я прорезал дырку в мягкой декоративной    "
  db "стенке..",0

Soft_wall_clean
  db "Я содрал остатки декоративной стенки.",0

Computer_break_chair_mess:
  db "Стул в руках развалился, но зкран треснул.",0

Computer_break_mess:
  db "Экран компьютера треснул..",0

Computer_add_shard_mess 
  db "Еще один хороший удар и терминал был      "
  db "полностью разбит..",0

Soft_wall_hit_mess:
  db "Удар поглощен мягкой стенкой.",0

