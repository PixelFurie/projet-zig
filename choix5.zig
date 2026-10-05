const std = @import("std");
const Io = std.Io;
pub fn main(init: std.process.Init) !void {
    var premier_nombre: f32 = 0;
    var deuxieme_nombre: f32 = 0;
    var resultat: f32 = 0;
    const io = init.io;
    var buf: [256]u8 = undefined;
    var stdin = Io.File.stdin().reader(io, &buf);
    const reader = &stdin.interface;
    std.debug.print("programme : multiplication\n\n", .{});
    std.debug.print("donne le premier nombre a multiplier ", .{});
    const ligne2 = (try reader.takeDelimiter('\n')) orelse return;
    premier_nombre = std.fmt.parseFloat(f32, std.mem.trim(u8, ligne2, " \r\n")) catch return;
    std.debug.print("donne le deuxieme nombre a multiplier", .{});
    const ligne3 = (try reader.takeDelimiter('\n')) orelse return;
    deuxieme_nombre = std.fmt.parseFloat(f32, std.mem.trim(u8, ligne3, " \r\n")) catch return;
    resultat = premier_nombre % deuxieme_nombre;
    std.debug.print("voicie le résulta de ton calcule{d}\n", .{resultat});
    var enfant = try std.process.spawn(io, .{
        .argv = &.{"./calculatrice"},
    });
    _ = try enfant.wait(io);
}
