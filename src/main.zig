const std = @import("std");
const rl = @import("raylib");
const Buttion = @import("buttion.zig").Buttion;

fn AddCoffee() void {
    std.debug.print("add coffee: \n", .{});
}

pub fn main() anyerror!void {
    // Initialization
    //--------------------------------------------------------------------------------------
    const screenWidth = 720;
    const screenHeight = 1080;

    // var test_text = "test text";
    const buttion = Buttion{
        .rec = rl.Rectangle{
            .height = 50,
            .width = 100,
            .x = 100,
            .y = 100,
        },
        .back_ground_color = .green,
        .onClick = AddCoffee,
    };

    var age: u32 = 30;

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

        _ = buttion.update();
        const name = "Alice";
        age += 1;
        const formatted_string = try std.fmt.allocPrint(std.heap.page_allocator, "Name: {s}, Age: {d}\n", .{ name, age });
        defer std.heap.page_allocator.free(formatted_string);
        // std.debug.print("{s}", .{formatted_string});

        // Draw
        //----------------------------------------------------------------------------------
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(.dark_gray);
        rl.drawText(@ptrCast(formatted_string), 190, 200, 32, .light_gray);
        buttion.draw();
        //----------------------------------------------------------------------------------
    }
}
