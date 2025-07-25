package game
import "core:fmt"
import RL "vendor:raylib"
Player :: struct {
	PlayerPos: Vector2,
	Scale:     Vector2,
	Speed:     f32,
}
PlayerControl :: proc(player: ^Player) {
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
	fmt.println(verWeight)
	fmt.println(horWeight)
	if horWeight != 0 || verWeight != 0 {
		XSPD: f32 = f32(horWeight) * player.Speed
		YSPD: f32 = f32(verWeight) * player.Speed
		player.PlayerPos.x += XSPD
		player.PlayerPos.y += YSPD
	}
	RL.DrawRectangleV(
		{player.PlayerPos.x, player.PlayerPos.y},
		{f32(WindowWidth / 10), f32(WindowHeight / 10)},
		RL.BLUE,
	)
}
