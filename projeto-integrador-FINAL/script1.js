
const canvas = document.getElementById("gameCanvas");
const ctx = canvas.getContext("2d");

const gridSize = 30;
const canvasSize = 600;
canvas.width = canvasSize;
canvas.height = canvasSize;

const pacManColor = "#FFFF00";
const pelletColor = "#FFFFFF";
const wallColor = "#0000FF";

const map = [
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1],
  [1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1],
  [1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1],
  [1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1],
  [1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1],
  [1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1],
  [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1],
  [1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1],
  [1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1],
  [1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1],
  [1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1]
];

let pacMan = {
  x: 1,
  y: 1,
  dx: 0,
  dy: 0,
  size: gridSize
};

let score = 0;

function drawMap() {
  for (let row = 0; row < map.length; row++) {
    for (let col = 0; col < map[row].length; col++) {
      if (map[row][col] === 1) {
        ctx.fillStyle = wallColor;
        ctx.fillRect(col * gridSize, row * gridSize, gridSize, gridSize); // Desenha a parede
      }
    }
  }
}

function drawPacMan() {
  ctx.beginPath();
  ctx.arc(pacMan.x * gridSize + gridSize / 2, pacMan.y * gridSize + gridSize / 2, pacMan.size / 2, 0.2 * Math.PI, 1.8 * Math.PI); // Forma de Pac-Man
  ctx.lineTo(pacMan.x * gridSize + gridSize / 2, pacMan.y * gridSize + gridSize / 2); // Conecta o centro
  ctx.fillStyle = pacManColor;
  ctx.fill();
}

function drawPellets() {
  for (let row = 0; row < map.length; row++) {
    for (let col = 0; col < map[row].length; col++) {
      if (map[row][col] === 0) {
        ctx.beginPath();
        ctx.arc(col * gridSize + gridSize / 2, row * gridSize + gridSize / 2, gridSize / 6, 0, 2 * Math.PI);
        ctx.fillStyle = pelletColor;
        ctx.fill();
      }
    }
  }
}

function movePacMan() {
  const nextX = pacMan.x + pacMan.dx;
  const nextY = pacMan.y + pacMan.dy;

  if (nextX >= 0 && nextX < map[0].length && nextY >= 0 && nextY < map.length && map[nextY][nextX] !== 1) {
    pacMan.x = nextX;
    pacMan.y = nextY;

    if (map[pacMan.y][pacMan.x] === 0) {
      map[pacMan.y][pacMan.x] = 2;
      score++;
    }
  }
}

function gameLoop() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  drawMap();
  drawPellets();
  drawPacMan();

  ctx.fillStyle = "#FFFFFF";
  ctx.font = "16px Arial";
  ctx.fillText("Pontuação: " + score, 10, 20);

  movePacMan();

  requestAnimationFrame(gameLoop);
}

function changeDirection(event) {
  if (event.key === "ArrowUp" && pacMan.dy === 0) {
    pacMan.dx = 0;
    pacMan.dy = -1;
  } else if (event.key === "ArrowDown" && pacMan.dy === 0) {
    pacMan.dx = 0;
    pacMan.dy = 1;
  } else if (event.key === "ArrowLeft" && pacMan.dx === 0) {
    pacMan.dy = 0;
    pacMan.dx = -1;
  } else if (event.key === "ArrowRight" && pacMan.dx === 0) {
    pacMan.dy = 0;
    pacMan.dx = 1;
  }
}

document.addEventListener("keydown", changeDirection);

gameLoop();