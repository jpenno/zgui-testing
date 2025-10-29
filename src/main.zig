const std = @import("std");
const rl = @import("raylib");

const Buttion = @import("widgets/buttion.zig").Buttion;

fn AddCoffee(coffee: []const u8) void {
    std.debug.print("add coffee: {s}\n", .{coffee});
}

pub fn main() anyerror!void {
    // Initialization
    //--------------------------------------------------------------------------------------
    const screenWidth = 720;
    const screenHeight = 1080;

    var buttion = Buttion{
        .rec = rl.Rectangle{
            .height = 50,
            .width = 100,
            .x = 100,
            .y = 100,
        },
        .back_ground_color = .green,
        .color = .green,
        .text = "buttion",
        .text_size = 25,
    };

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow(); // Close window and OpenGL context

    rl.setTargetFPS(60); // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!rl.windowShouldClose()) { // Detect window close button or ESC key
        // Update
        //----------------------------------------------------------------------------------
        // TODO: Update your variables here
        //----------------------------------------------------------------------------------

        switch (buttion.update()) {
            .Clicked => {
                AddCoffee("black market");
            },
            else => {},
        }

        // Draw
        //----------------------------------------------------------------------------------
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(.dark_gray);
        buttion.draw();
        //----------------------------------------------------------------------------------
    }
}
