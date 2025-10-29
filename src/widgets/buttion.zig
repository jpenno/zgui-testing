const std = @import("std");
const rl = @import("raylib");

pub const State = enum {
    Clicked,
    Hovered,
    Delault,
};

pub const Buttion = struct {
    rec: rl.Rectangle,
    text: []const u8,
    text_size: i32 = 20,
    color: rl.Color,
    back_ground_color: rl.Color,

    // TODO: make init

    pub fn update(buttion: *Buttion) State {
        if (rl.checkCollisionRecs(buttion.rec, rl.Rectangle{
            .x = @floatFromInt(rl.getMouseX()),
            .y = @floatFromInt(rl.getMouseY()),
            .height = 1,
            .width = 1,
        })) {
            if (rl.isMouseButtonPressed(.left)) {
                return .Clicked;
            }
            buttion.color = rl.Color.blue;
            return .Hovered;
        }

        buttion.color = buttion.back_ground_color;
        return .Delault;
    }

    pub fn draw(buttion: Buttion) void {
        rl.drawRectangleRec(buttion.rec, buttion.color);

        const text_y: i32 = @as(i32, @intFromFloat(buttion.rec.y + (buttion.rec.height / 2))) -
            @divFloor(buttion.text_size, 2);

        const text_x: i32 = @as(i32, @intFromFloat(buttion.rec.x + (buttion.rec.width / 2))) -
            @divFloor(rl.measureText(@ptrCast(buttion.text), buttion.text_size), 2);

        rl.drawText(
            @ptrCast(buttion.text),
            text_x,
            text_y,
            buttion.text_size,
            rl.Color.black,
        );
    }
};
