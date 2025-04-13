
import {Response, Request} from "express";


export const currentTime = async (req: Request, res: Response) => {

  const  time = new Date().toISOString()

  res.json({currentTime: time})

};