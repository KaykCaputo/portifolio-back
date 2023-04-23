import { Request, Response } from 'express'

class UserController {
    getUser(req: Request, res: Response) {
        res.send("teste1")
    }
}

export default new UserController()