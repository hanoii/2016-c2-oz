declare
X={NewCell 0}
{Assign X 5}
Y=X
{Assign Y 10}
{Browse {Access X}==10} % true, x e y referencian la misma celda
{Browse X==Y} %true, idem anterior
Z={NewCell 10}
{Browse Z==Y} %false, no son la misma referencia de celda
{Browse @X==@Z} %true, el valor de las dos celdas es el mismo
