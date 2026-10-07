const std = @import("std");
const Io = std.Io;
pub fn main(init: std.process.Init) !void {
    var choix: u32 = 1;
    const io = init.io;
    var buf: [256]u8 = undefined;
    var stdin = Io.File.stdin().reader(io, &buf);
    const reader = &stdin.interface;
    std.debug.print("tu a le choix entre :\n 1(delta)\n 2(forme canonique)\n 3(alpha)\n 4(beta)\n 5(retourner au option)", .{});
    const ligne = (try reader.takeDelimiter('\n')) orelse return;
    const texte = std.mem.trim(u8, ligne, " \r\n");
    choix = std.fmt.parseInt(u32, texte, 10) catch return;
    if (choix == 1) {
        var enfant = try std.process.spawn(io, .{
            .argv = &.{"./delta"},
        });
        _ = try enfant.wait(io);
    } else if (choix == 2) {
        var esa = try std.process.spawn(io, .{
            .argv = &.{"./canonique"},
        });
        _ = try esa.wait(io);
    } else if (choix == 3) {
        var joye = try std.process.spawn(io, .{
            .argv = &.{"./alpha"},
        });
        _ = try joye.wait(io);
    } else if (choix == 4) {
        var go = try std.process.spawn(io, .{
            .argv = &.{"./beta"},
        });
        _ = try go.wait(io);
    } else if (choix == 5) {
        var fin = try std.process.spawn(io, .{
            .argv = &.{"./calculatrice"},
        });
        _ = try fin.wait(io);
    }
}
