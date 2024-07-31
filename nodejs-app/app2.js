// app.js
const express = require('express');
const app = express();
const port = 3001;
const mongoose = require('mongoose');
const mongoUri = 'mongodb://my-user:password@10.104.0.14:27017,10.104.0.15:27017,10.104.1.5:27017';
let dbClient;

const client = require("prom-client");

mongoose.connect(mongoUri, { useNewUrlParser: true, useUnifiedTopology: true })
  .then((client) => {console.log('MongoDB connected - DB Local'); 
    dbClient = client;
  })
  .catch(err => console.error('MongoDB connection error - New:', err));

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});

//Create a Registry to register the metrics
const register = new client.Registry();

// The metrics we would like to collect:
// 1. A gauge for the current number of active requests
const activeRequests = new client.Gauge({
  name: "active_requests",
  help: "Number of active requests",
  labelNames: ["method", "endpoint"],
});

// 2. A counter for the total number of requests
const totalRequests = new client.Counter({
  name: "app_total_requests",
  help: "Total number of requests",
  labelNames: ["method", "endpoint", "status"],
});

// Register the metrics
register.registerMetric(activeRequests);
register.registerMetric(totalRequests);

client.collectDefaultMetrics({ register });

// Add a middleware that increases activeRequests on request and decreases on response
app.use((req, res, next) => {
  // Increment with labels
  activeRequests.inc({
    method: req.method,
    endpoint: req.path,
  });

  totalRequests.inc({
    method: req.method,
    endpoint: req.path,
  });

  res.on("finish", () => {
    // Decrement with labels for active requests
    activeRequests.dec({
      method: req.method,
      endpoint: req.path,
    });

  });

  next();
});

// Define a route to expose the metrics
app.get("/metrics", async (req, res) => {
  // Allow Prometheus to scrape the metrics
  res.set("Content-Type", register.contentType);
  res.end(await register.metrics());
});

app.use('/', async (req, res) => {
    if (dbClient) {
        const collection = dbClient.connection.useDb('local').collection('welcome');
        const data = await collection.find({"_id":"default_key"}).toArray();
        console.log(data[0].page_text)
        res.send(data[0].page_text);
    } else {
        res.send('Loading...')
    }  
});
  