
const canvas = document.getElementById("gameCanvas");
const ctx = canvas.getContext("2d");

const gridSize = 20;
const canvasSize = 400;
canvas.width = canvasSize;
canvas.height = canvasSize;

const snakeColor = "#00f";
const foodColor = "#fff";

let snake = [{x: 160, y: 160}, {x: 140, y: 160}, {x: 120, y: 160}];
let food = {x: 80, y: 80};
let dx = gridSize;
let dy = 0;
let score = 0;
let isGameRunning = false;

function drawSnake() {
  snake.forEach((segment, index) => {
    ctx.fillStyle = snakeColor;
    ctx.fillRect(segment.x, segment.y, gridSize, gridSize);
  });
}

function drawFood() {
  ctx.fillStyle = foodColor;
  ctx.fillRect(food.x, food.y, gridSize, gridSize);
}

function moveSnake() {
  const head = {x: snake[0].x + dx, y: snake[0].y + dy};
  snake.unshift(head);
  
  if (head.x === food.x && head.y === food.y) {
    score++;
    generateFood();
  } else {
    snake.pop();
  }
}

function generateFood() {
  food = {
    x: Math.floor(Math.random() * (canvasSize / gridSize)) * gridSize,
    y: Math.floor(Math.random() * (canvasSize / gridSize)) * gridSize
  };
}

function checkCollisions() {
  const head = snake[0];

  if (head.x < 0 || head.x >= canvasSize || head.y < 0 || head.y >= canvasSize) {
    return true;
  }

  for (let i = 1; i < snake.length; i++) {
    if (head.x === snake[i].x && head.y === snake[i].y) {
      return true;
    }
  }

  return false;
}

function gameLoop() {
  if (!isGameRunning) return;

  if (checkCollisions()) {
    alert("Game Over! Sua pontuação: " + score);
    snake = [{x: 160, y: 160}, {x: 140, y: 160}, {x: 120, y: 160}];
    dx = gridSize;
    dy = 0;
    score = 0;
    isGameRunning = false;
    startCountdown();
    return;
  }

  ctx.clearRect(0, 0, canvas.width, canvas.height);
  moveSnake();
  drawSnake();
  drawFood();

  ctx.fillStyle = "#fff";
  ctx.font = "20px Arial";
  ctx.textAlign = "left";
  ctx.fillText("Pontuação: " + score, 10, 30);

  setTimeout(gameLoop, 100);
}

function changeDirection(event) {
  if (!isGameRunning) return;

  if (event.key === "ArrowUp" && dy === 0) {
    dx = 0;
    dy = -gridSize;
  } else if (event.key === "ArrowDown" && dy === 0) {
    dx = 0;
    dy = gridSize;
  } else if (event.key === "ArrowLeft" && dx === 0) {
    dx = -gridSize;
    dy = 0;
  } else if (event.key === "ArrowRight" && dx === 0) {
    dx = gridSize;
    dy = 0;
  }
}

function startCountdown() {
  let countdown = 3;
  const interval = setInterval(() => {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.fillStyle = "#fff";
    ctx.font = "40px Arial";
    ctx.textAlign = "center";
    ctx.fillText(countdown, canvas.width / 2, canvas.height / 2);

    countdown--;

    if (countdown < 0) {
      clearInterval(interval);
      isGameRunning = true;
      gameLoop();
    }
  }, 1000);
}

document.addEventListener("keydown", changeDirection);

startCountdown();