function example() {
  console.log("hi alex");
}

async function example_async() {
  await "value";

  return new Promise((resolve, _reject) => resolve);
}

example();
