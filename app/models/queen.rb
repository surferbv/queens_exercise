class Queen < ChessPiece

    attribute :kind, :integer, default: 4

    def can_attack?(piece1 = self.get_position, piece2)
        
        # same row
        return true if piece1[:x] == piece2[:x]
        return true if piece1[:y] == piece2[:y]

        x = piece1[:x] 
        y = piece1[:y] 

        # left diag
        while x > self.get_board_lower && y > self.get_board_lower 
            return true if { x: x-=1, y: y-=1} == piece2
        end

        # right diag
        while x < self.get_board_upper && y < self.get_board_upper 
            return true if { x: x+=1, y: y+=1} == piece2
        end

        return false
    end

    # other_pieces = [{x: 1, y: 3}, {x: 1, y: 3}]
    def can_attack_with_other_pieces?(piece1, piece2, other_pieces)

        can_attack  = can_attack?(piece1, piece2)
        is_clear    = true 

        if can_attack
            other_pieces.each do |piece|
                is_clear = !can_attack?(piece1, piece)
            end
        end

        return can_attack && is_clear

    end 

end
        