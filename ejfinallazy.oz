declare
fun lzay {F X} 2*X end
fun lazy {G X} 3*X end
fun {H X} 4*X end
A = {F 3}
{Browse A}
B = {G 4}
{Browse B}
C = A + {H 5}
{Browse C}