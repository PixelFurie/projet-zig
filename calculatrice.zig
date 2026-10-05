const std = @import("std");
const Io = std.Io;
pub fn main(init: std.process.Init) !void {
    var choix: u32 = 1;
    const io = init.io;
    var buf: [256]u8 = undefined;
    var stdin = Io.File.stdin().reader(io, &buf);
    const reader = &stdin.interface;
    std.debug.print("tu a le choix entre :\n 1(adition)\n 2(soustraction)\n 3(multiplication)\n 4(division)\n 5(aret)", .{});
    const ligne = (try reader.takeDelimiter('\n')) orelse return;
    const texte = std.mem.trim(u8, ligne, " \r\n");
    choix = std.fmt.parseInt(u32, texte, 10) catch return;
    if (choix == 1) {
        var enfant = try std.process.spawn(io, .{
            .argv = &.{"./choix1"},
        });
        _ = try enfant.wait(io);
    } else if (choix == 2) {
        var enfant = try std.process.spawn(io, .{
            .argv = &.{"./choix2"},
        });
        _ = try enfant.wait(io);
    } else if (choix == 3) {
        var enfant = try std.process.spawn(io, .{
            .argv = &.{"./choix3"},
        });
        _ = try enfant.wait(io);
    } else if (choix == 4) {
        var enfant = try std.process.spawn(io, .{
            .argv = &.{"./choix4"},
        });
        _ = try enfant.wait(io);
    } else if (choix == 5) {
        var enfant = try std.process.spawn(io, .{
            .argv = &.{"./choix5"},
        });
        _ = try enfant.wait(io);
    } else if (choix == 6) {
        var enfant = try std.process.spawn(io, .{
            .argv = &.{"./arret"},
        });
        _ = try enfant.wait(io);
    } else {
        std.debug.print("taper bien le numéro coréspondant a votre choix\n", .{});
        var enfant = try std.process.spawn(io, .{
            .argv = &.{"./exercise2"},
        });
        _ = try enfant.wait(io);
    }
}
