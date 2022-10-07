class ChessPiece < ApplicationRecord
    validates :x, :y, :kind, :colour, presence: true

    enum kind: {pawn: 0, bishop: 1, knight: 2, rook: 3, queen: 4, king: 5}
    enum colour: {white: 0, black: 1}
    
    def get_kind
        self.kind
    end

    def get_position
        {x: self.x, y: self.y}
    end

    def get_board
        [8,8]
    end

    def get_board_lower
        self.get_board[0]
    end

    def get_board_upper
        self.get_board[0]
    end

    def can_attack?(piece1, piece2)
        raise 'must implment can_attack?'
    end

end
