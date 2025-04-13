
import { Router } from "express";

import {healthCheck } from "../controllers/health-check";

const healthCheckRounter = Router()

healthCheckRounter
.get("/",
 healthCheck
)

export default healthCheckRounter;