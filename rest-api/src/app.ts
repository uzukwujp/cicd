

import express from "express";
import {json} from "body-parser";
import "express-async-errors";
import cors from "cors"

import { errorHandler } from "./helper-function/error-handler";
import currentTimeRounter from "./routes/current-time";
import healthCheckRounter from "./routes/health-check";


const app = express()


app.set('trust proxy', false);
app.use(cors())
app.use(json())

app.use(currentTimeRounter)
app.use(healthCheckRounter)
app.use(errorHandler)

export default app;