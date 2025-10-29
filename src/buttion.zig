const std = @import("std");
const rl = @import("raylib");

pub const State = enum {
    Clicked,
    Hovered,
    Delault,
};

pub const Buttion = struct {
    rec: rl.Rectangle,
    back_ground_color: rl.Color,
    state: State = .Delault,
    onClick: fn () void,

    pub fn update(buttion: Buttion) State {
        if (rl.checkCollisionRecs(buttion.rec, rl.Rectangle{
            .x = @floatFromInt(rl.getMouseX()),
            .y = @floatFromInt(rl.getMouseY()),
            .height = 1,
            .width = 1,
        }) and rl.isMouseButtonPressed(.left)) {
            buttion.onClick();
        }
        return buttion.state;
    }

    pub fn draw(buttion: Buttion) void {
        rl.drawRectangleRec(buttion.rec, buttion.back_ground_color);
    }
};
