
import {Response, Request} from "express";


export const healthCheck = async (req: Request, res: Response) => {

  res.status(200).send()
};