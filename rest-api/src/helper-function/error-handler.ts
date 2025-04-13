

import express, {Request, Response, NextFunction} from "express";


export const errorHandler = (err: Error, req: Request, res: Response, next: NextFunction ) => {

    console.error(err)
    const message = "internal server error"
    res.status(500).send(`${message}`) 

};