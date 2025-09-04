export default class Utils {

    scramble: string;

    constructor() {
        this.scramble = this.getScramble();
    }

    moves = ["F", "U", "R", "D", "L", "B"]
    types = [" ", "2", "'"]
  

    getScramble() {
        let scramble = []
        let numberOfMoves = 20
        let lastMove = null
        let lastAxis = null

        for (let i = 0; i < numberOfMoves; i++) {
            let nextMove = this.getRandomMove(lastMove, lastAxis)
            scramble.push(nextMove + this.getRandomType())
            
            lastMove = nextMove
            lastAxis = this.getAxis(nextMove)
        }

        return scramble.join(" ");
    }

    getRandomMove(lastMove: string | null, lastAxis: string | null | undefined): string {
        let next = this.moves[Math.floor((Math.random() * this.moves.length))]
        let nextAxis = this.getAxis(next)

        if (next === lastMove || nextAxis === lastAxis) {
            return this.getRandomMove(lastMove, lastAxis)
        }

        return next
    }

    getRandomType() {
        return this.types[Math.floor((Math.random() * this.types.length))]
    }

    getAxis(move: string) {
        if (move === "U" || move === "D") return 'y'
        if (move === "F" || move === "B") return 'z'
        if (move === "L" || move === "R") return 'x'
    }
}