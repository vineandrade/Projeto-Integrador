const boardSize = 10;
const mineCount = 10;
let board = [];
let revealedCount = 0;
let gameOver = false;

function restartGame() {
    board = [];
    revealedCount = 0;
    gameOver = false;
    createBoard();
    placeMines();
    countAdjacentMines();
    renderBoard();
}

function createBoard() {
    const boardElement = document.getElementById('board');
    boardElement.innerHTML = '';

    for (let row = 0; row < boardSize; row++) {
        const rowArray = [];
        for (let col = 0; col < boardSize; col++) {
            rowArray.push({
                revealed: false,
                flagged: false,
                mine: false,
                adjacentMines: 0
            });

            const cellElement = document.createElement('div');
            cellElement.classList.add('cell');
            cellElement.setAttribute('data-row', row);
            cellElement.setAttribute('data-col', col);
            cellElement.addEventListener('click', handleCellClick);
            cellElement.addEventListener('contextmenu', handleCellRightClick);
            boardElement.appendChild(cellElement);
        }
        board.push(rowArray);
    }
}

function placeMines() {
    let minesPlaced = 0;

    while (minesPlaced < mineCount) {
        const row = Math.floor(Math.random() * boardSize);
        const col = Math.floor(Math.random() * boardSize);

        if (!board[row][col].mine) {
            board[row][col].mine = true;
            minesPlaced++;
        }
    }
}

function countAdjacentMines() {
    for (let row = 0; row < boardSize; row++) {
        for (let col = 0; col < boardSize; col++) {
            if (board[row][col].mine) continue;

            let adjacentMines = 0;
            for (let i = -1; i <= 1; i++) {
                for (let j = -1; j <= 1; j++) {
                    const newRow = row + i;
                    const newCol = col + j;
                    if (newRow >= 0 && newRow < boardSize && newCol >= 0 && newCol < boardSize) {
                        if (board[newRow][newCol].mine) {
                            adjacentMines++;
                        }
                    }
                }
            }

            board[row][col].adjacentMines = adjacentMines;
        }
    }
}

function renderBoard() {
    const boardElement = document.getElementById('board');
    const cells = boardElement.getElementsByClassName('cell');

    Array.from(cells).forEach(cellElement => {
        const row = parseInt(cellElement.getAttribute('data-row'));
        const col = parseInt(cellElement.getAttribute('data-col'));
        const cell = board[row][col];

        cellElement.classList.remove('revealed', 'mine', 'flagged');

        if (cell.revealed) {
            cellElement.classList.add('revealed');
            if (cell.mine) {
                cellElement.classList.add('mine');
                cellElement.innerHTML = '💣';
            } else {
                cellElement.innerHTML = cell.adjacentMines > 0 ? cell.adjacentMines : '';
            }
        } else if (cell.flagged) {
            cellElement.classList.add('flagged');
            cellElement.innerHTML = '🚩';
        } else {
            cellElement.innerHTML = '';
        }
    });
}

function handleCellClick(event) {
    if (gameOver) return;
    const row = parseInt(event.target.getAttribute('data-row'));
    const col = parseInt(event.target.getAttribute('data-col'));
    const cell = board[row][col];

    if (cell.revealed || cell.flagged) return;

    cell.revealed = true;
    revealedCount++;

    if (cell.mine) {
        gameOver = true;
        alert('Você perdeu! A mina explodiu!');
    } else if (cell.adjacentMines === 0) {
        revealAdjacentCells(row, col);
    }

    if (revealedCount === boardSize * boardSize - mineCount) {
        gameOver = true;
        alert('Você ganhou! Parabéns!');
    }

    renderBoard();
}

function handleCellRightClick(event) {
    event.preventDefault();

    if (gameOver) return;

    const row = parseInt(event.target.getAttribute('data-row'));
    const col = parseInt(event.target.getAttribute('data-col'));
    const cell = board[row][col];

    if (cell.revealed) return;

    cell.flagged = !cell.flagged;
    renderBoard();
}

function revealAdjacentCells(row, col) {
    for (let i = -1; i <= 1; i++) {
        for (let j = -1; j <= 1; j++) {
            const newRow = row + i;
            const newCol = col + j;

            if (newRow >= 0 && newRow < boardSize && newCol >= 0 && newCol < boardSize) {
                const adjacentCell = board[newRow][newCol];

                if (!adjacentCell.revealed && !adjacentCell.mine) {
                    adjacentCell.revealed = true;
                    revealedCount++;

                    if (adjacentCell.adjacentMines === 0) {
                        revealAdjacentCells(newRow, newCol);
                    }
                }
            }
        }
    }
}

document.getElementById('restartBtn').addEventListener('click', restartGame);
restartGame(); 