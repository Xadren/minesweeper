A cell will have the following states
- Unknown [0]
- Known [3]
- Flagged [2]
- Mine [1]

A known state cell will have the following attributes
- It will know if there is a mine adjacent to it.
- It will know if there are no mines adjacent to it. When it knows this, it will expand one cell each way until it finds a cell adjacent to it.