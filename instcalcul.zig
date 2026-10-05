const std = @import("std");
const Io = std.Io;
pub fn main(init: std.process.Init) !void {
    const io = init.io;
    std.debug.print("l'instalateur compile les fichier pour le bon fonctionement de la calculatrice\n", .{});
    var enfant = try std.process.spawn(io, .{
        .argv = &.{ "zig", "build-exe", "calculatrice.zig" },
    });
    _ = try enfant.wait(io);
    var godee = try std.process.spawn(io, .{
        .argv = &.{ "zig", "build-exe", "choix1.zig" },
    });
    _ = try godee.wait(io);
    var ta_vie = try std.process.spawn(io, .{
        .argv = &.{ "zig", "build-exe", "choix2.zig" },
    });
    _ = try ta_vie.wait(io);
    var eve = try std.process.spawn(io, .{
        .argv = &.{ "zig", "build-exe", "choix3.zig" },
    });
    _ = try eve.wait(io);
    var donne = try std.process.spawn(io, .{
        .argv = &.{ "zig", "build-exe", "choix4.zig" },
    });
    _ = try donne.wait(io);
    var fin = try std.process.spawn(io, .{
        .argv = &.{ "zig", "build-exe", "arret.zig" },
    });
    _ = try fin.wait(io);
    var go = try std.process.spawn(io, .{
        .argv = &.{ "zig", "build-exe", "choix5.zig" },
    });
    _ = try go.wait(io);
    std.debug.print("s'est terminer\n", .{});
}
