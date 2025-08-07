package game
import "core:fmt"
import RL "vendor:raylib"
Player :: struct {
	PlayerPos: Vector2,
	Scale:     Vector2,
	Speed:     f32,
}
PlayerControl :: proc(p: ^Player) {
	horWeight, verWeight: i8
	if RL.IsKeyDown(.LEFT) {
		horWeight -= 1
	};if RL.IsKeyDown(.RIGHT) {
		horWeight += 1
	};if RL.IsKeyDown(.UP) {
		verWeight -= 1
	};if RL.IsKeyDown(.DOWN) {
		verWeight += 1
	}
	if horWeight != 0 || verWeight != 0 {
		XSPD: f32 = f32(horWeight) * p.Speed
		YSPD: f32 = f32(verWeight) * p.Speed
		p.PlayerPos.x += XSPD
		p.PlayerPos.y += YSPD
	}
	if RL.IsKeyDown(.LEFT_SHIFT) {
		value = 1
		Signal(&PlayerSig)
	} else {value = 0;Signal(&PlayerSig)}

	switch val2 {
	case 0:
		RL.DrawRectangleV(
			{p.PlayerPos.x, p.PlayerPos.y},
			{f32(WindowWidth / 10), f32(WindowHeight / 10)},
			RL.BLUE,
		)
		break
	case 2:
		RL.DrawRectangleV(
			{p.PlayerPos.x, p.PlayerPos.y},
			{f32(WindowWidth / 10), f32(WindowHeight / 10)},
			RL.RED,
		)
		break

	}

}
