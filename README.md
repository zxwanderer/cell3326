# cell3326


набор обьектов
256 * ObjectSize 

обьекты плюс набор обьектов
N * ObjectSize + 256 * 2 = 512 + N * ObjectSize

256 * ObjectSize  > 512 + N * ObjectSize 

256 * ObjectSize - 512 >  N * ObjectSize 


(256 * ObjectSize - 512) / ObjectSize > N

256 - 512 / ObjectSize - N > 0


ObjectSize = 4

128 > N

256 * 4 = 1024
512 + 128 * 4 = 512 + 512 = 1024

N = 20
512 + 20 * 4 = 512 + 80 = 592

N = 30
512 + 30 * 4 = 512 + 120 = 632

N = 40
512 + 40 * 4 = 512 + 160 = 662
