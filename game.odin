package game

// NOTE: Capital import names for ease of differentiations
import "core:fmt"
import "core:math"
import RL "vendor:raylib"
WindowHeight, WindowWidth: i32
PlayerPos: Vector2
PlayerSig: SignalType
value: i8 = 0
val2: i8 = 0
main :: proc() {
	RL.InitWindow(800, 600, "Goober")
	RL.SetTargetFPS(60)
	RL.SetWindowState(RL.ConfigFlags{RL.ConfigFlag.FULLSCREEN_MODE})
	WindowHeight, WindowWidth = RL.GetScreenHeight(), RL.GetScreenWidth()
	player: Player = {
		Scale     = {16, 16},
		PlayerPos = {0, 0},
		Speed     = 16,
	}
	player.PlayerPos = {
		f32(WindowWidth / 2) - f32(player.Scale.x / 2),
		f32(WindowHeight / 2) - f32(player.Scale.y / 2),
	}
	AddListener(&PlayerSig, proc() {
		val2 = i8(value * 2)
	})


	for !RL.WindowShouldClose() {
		RL.BeginDrawing()
		ShouldntClose()
		PlayerControl(&player)
		RL.EndDrawing()
	}
	RL.CloseWindow()
}
ShouldntClose :: proc() {
	scaleX, scaleY: f32 = RL.GetWindowScaleDPI().x, RL.GetWindowScaleDPI().y
	WindowHeight, WindowWidth =
		i32(scaleY) * RL.GetScreenHeight(), i32(scaleX) * RL.GetScreenWidth()
	RL.ClearBackground(RL.DARKPURPLE)
	RectWidth, RectHeight: i32 = i32(WindowWidth / 10), i32(WindowHeight / 10)
}
