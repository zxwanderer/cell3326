HELLO_TXT:
; db "012345678901234567890123456789012345678901"
  db " CELL 3326       v1.2.1        22.03.2023 "
  db "------------------------------------------"
  db "������ ���! � ���� �������� � ����� � ����"
  db "����. ����� ������� - �����, ����������", 13
  db "������, ����������� �� ������� � �������.", 13
  ; db "------------------------------------------"
  ; db 13
  db "-----------[���������� � ����]------------"
  ; db "���������� � ����:                        "
  db "������ �������,QAOP-������������", 13
  db "Enter,Space,M - ������ �������� �� �����",13
  db "����� ����� ���������� ��� ���������,����-"
  db "��� ��������� � �����.", 13
  db "G-����� � ���� � ������� ����", 13
  db "------------------------------------------"
  db "��� Wanderer,������ AER,������� ����� ��", 13
  db "��� LaserSquad,Stalker,Monstrland", 13
  db "------------------------------------------"
  db "Thank's to Videogames Sematary for 2-hours"
  db "game stream video, Shiru for operative and"
  db "detailed information about the beeproblem "
  db "sound and Modern ZX-Retro Gaming Channel  "
  db "for walkthrough video..",13
  db "------------------------------------------"
  db "����: zxwanderer.github.io/cell3326", 13
  db "------------------------------------------"
  db _endByte

Empty_cell_name: db "�����",0
Floor_cell_name: db "������",0
Door_cell_name: db "�����",0
Bed_cell_name: db "�������",0
Table_cell_name: db "����", 0
Computer_cell_name: db "��������",0
Computer_break_cell_name: db "�������� ��������",0
Trash_cell_name: db "������ ������� � �����",0
Trash_name: db "�����", 0
PDA_cell_name: db "����������� �������", 0
Keramit_cell_name: db "�������", 0
Grass_cell_name: db "�����", 0
Bush_cell_name: db "���������", 0

Gravel_cell_name: db "������", 0
AirLand_cell_name: db "���������� ��������", 0
NavLight_cell_name: db "������������� ����", 0

Canister_cell_name: db "������ ������������", 0
CanisterEmpty_cell_name: db "������ ������������", 0
CanisterPowered_cell_name: db "�������� ������������", 0
Generator_cell_name: db "������������ �������", 0
Nipple_cell_name: db "�������� ��� �������������", 0

Nippers_item_name: db "�������������� �������������� �����", 0
Wrench_cell_name: db "������� ����-�����", 0

Analyzer_cell_name: db "����������", 0
Anabiose_cell_name: db "���������� ������", 0
AnabioseOpen_cell_name: db "�������� ���������� ������", 0

ScafPlace_cell_name: db "������ ��� ���������", 0
Scaf_cell_name: db "������ ��������", 0
HardScaf_cell_name: db "������� ������ ��������", 0

BodyTech_cell_name:
  db "���� �������� � ������ �������, �������",13
  db "����������� ���", 0

BodyInScaf_cell_name:
  db "���� �������� � ���������, �������� ������"
  db "�������������� ������� � ����������." , 0

Body_cell_name:
  db "���� ��������, ���� �� ���������������",13
  db "������", 0

Soft_wall_name: db "������ ������������ �����",0
Cavity_cell_name: db "������ ����� ��� �����������", 0
Electronic_cell_name: db "����������� ���� ����������",0
Electronic_break_name: db "��������� �����������", 0
Mentoscanner_cell_name: db "������������", 0
ElectonicDestroy_cell_name: db "������� ������������", 0
PlantPot_cell_name: db "�������� � ������", 0
Wall_cell_name: db "������� ����������",0
WallHole_name: db "������� ���� � �����",0

Chair_item_name: db "����",0
Shard_item_name: db "������ ����������� �������",0

Computer_off_mess:
  db "�������� ��� ���������.� ��������� �������"
  db "������ � �� ����������..", 0

Computer_off_hit_mess:
  db "���������..", 0
