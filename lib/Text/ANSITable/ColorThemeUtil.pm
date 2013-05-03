package Text::ANSITable::ColorThemeUtil;

use 5.010;
use strict;
use warnings;

our $VERSION = '0.06'; # VERSION

# create a new derived theme from a based theme by applying transforms to its
# RGB values (ANSI colors are passed unchanged).
sub derive_theme_transform_rgb {
    my ($basect, $func) = @_;

    my $derivedct = {};

    for my $cn (keys %{ $basect->{colors} }) {
        my $cv = $basect->{colors}{$cn};

        if ($cv) {
            $derivedct->{colors}{$cn} = sub {
                my ($self, %args) = @_;
                my $basec = $basect->{colors}{$cn};
                if (ref($basec) eq 'CODE') {
                    $basec = $basec->($self, name=>$cn, %args);
                }
                if ($basec) {
                    if (ref($basec) eq 'ARRAY') {
                        $basec = [map {defined($_) && /^#?[0-9A-Fa-f]{6}$/ ? $func->($_) : $_} @$basec];
                    } else {
                        for ($basec) {
                            $_ = defined($_) && /^#?[0-9A-Fa-f]{6}$/ ? $func->($_) : $_;
                        }
                    }
                }
                return $basec;
            };
        } else {
            #$derivedct->{colors}{$cn} = $cv;
        }
    }
    $derivedct;
}

sub modify_rgb_weights {

    my ($rgb, $fr1, $fg1, $fb1, $fr2, $fg2, $fb2, $fr3, $fg3, $fb3) = @_;

    $rgb =~ /^#?([0-9A-Fa-f]{2})([0-9A-Fa-f]{2})([0-9A-Fa-f]{2})$/o
        or die "Invalid rgb color, must be in 'ffffff' form";
    my $r = hex($1);
    my $g = hex($2);
    my $b = hex($3);

    # reference:
    # http://www.techrepublic.com/blog/howdoi/how-do-i-convert-images-to-grayscale-and-sepia-tone-using-c/120
    # with modified numbers. currently only by trial-and-error.
    my $or = ($r*$fr1) + ($g*$fg1) + ($b*$fb1);
    my $og = ($r*$fr2) + ($g*$fg2) + ($b*$fb2);
    my $ob = ($r*$fr3) + ($g*$fg3) + ($b*$fb3);
    for ($or, $og, $ob) { $_ = 255 if $_ > 255 }
    return sprintf("%02x%02x%02x", $or, $og, $ob);
}

# original sepia weights:
#0.393, 0.769, 0.189,
#0.349, 0.686, 0.168,
#0.272, 0.534, 0.131


1;
# ABSTRACT: Utility routines


__END__
=pod

=encoding utf-8

=head1 NAME

Text::ANSITable::ColorThemeUtil - Utility routines

=head1 VERSION

version 0.06

=for Pod::Coverage ^(.+)$

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 DESCRIPTION

=head1 FUNCTIONS


None are exported by default, but they are exportable.

=cut

