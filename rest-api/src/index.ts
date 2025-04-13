
import app from "./app";

const startUp = (port?: number) => {

  const Port = port || process.env.Port

  app.listen(Port, ()=> {
    console.log(`server listening on port:${Port}`)
  })

};


startUp(4000)