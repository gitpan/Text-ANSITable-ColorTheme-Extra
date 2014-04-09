package Text::ANSITable::ColorTheme::Tint;

use 5.010;
use strict;
use warnings;

use Data::Clone;
use SHARYANTO::Color::Util qw(tint_rgb_color);
use SHARYANTO::ColorTheme::Util qw(create_color_theme_transform);
require Text::ANSITable;

our $VERSION = '0.13'; # VERSION

our %color_themes = ();

my $defct = Text::ANSITable->get_color_theme("Default::default_gradation");
$defct->{colors}{str_data} = '7f7f7f';

{
    my $ct = create_color_theme_transform(
        $defct, sub {tint_rgb_color(shift, 'ff0000')});
    $ct->{v} = 1.1;
    $ct->{summary} = 'Red-tinted (50%)';
    $color_themes{tint_red} = $ct;
}

{
    my $ct = create_color_theme_transform(
        $defct, sub {tint_rgb_color(shift, 'ff8000')});
    $ct->{v} = 1.1;
    $ct->{summary} = 'Orange-tinted (50%)';
    $color_themes{tint_orange} = $ct;
}

{
    my $ct = create_color_theme_transform(
        $defct, sub {tint_rgb_color(shift, 'ffff00')});
    $ct->{v} = 1.1;
    $ct->{summary} = 'Yellow-tinted (50%)';
    $color_themes{tint_yellow} = $ct;
}

{
    my $ct = create_color_theme_transform(
        $defct, sub {tint_rgb_color(shift, '00ff00')});
    $ct->{v} = 1.1;
    $ct->{summary} = 'Green-tinted (50%)';
    $color_themes{tint_green} = $ct;
}

{
    my $ct = create_color_theme_transform(
        $defct, sub {tint_rgb_color(shift, '0000ff')});
    $ct->{v} = 1.1;
    $ct->{summary} = 'Blue-tinted (50%)';
    $color_themes{tint_blue} = $ct;
}

{
    my $ct = create_color_theme_transform(
        $defct, sub {tint_rgb_color(shift, 'ff00ff')});
    $ct->{v} = 1.1;
    $ct->{summary} = 'Magenta-tinted (50%)';
    $color_themes{tint_magenta} = $ct;
}

{
    my $ct = create_color_theme_transform(
        $defct, sub {tint_rgb_color(shift, '00ffff')});
    $ct->{v} = 1.1;
    $ct->{summary} = 'Cyan-tinted (50%)';
    $color_themes{tint_cyan} = $ct;
}

{
    my $ct = create_color_theme_transform(
        $defct, sub {tint_rgb_color(shift, '000000')});
    $ct->{v} = 1.1;
    $ct->{summary} = 'Black-tinted (50%)';
    $color_themes{tint_black} = $ct;
}

1;
# ABSTRACT: Several tinted color themes

__END__

=pod

=encoding UTF-8

=head1 NAME

Text::ANSITable::ColorTheme::Tint - Several tinted color themes

=head1 VERSION

version 0.13

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/Text-ANSITable-ColorTheme-Extra>.

=head1 SOURCE

Source repository is at L<https://github.com/sharyanto/perl-Text-ANSITable-ColorTheme-Extra>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website L<https://rt.cpan.org/Public/Dist/Display.html?Name=Text-ANSITable-ColorTheme-Extra>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 INCLUDED COLOR THEMES

=over

=item * tint_black (Black-tinted (50%))

=item * tint_blue (Blue-tinted (50%))

=item * tint_cyan (Cyan-tinted (50%))

=item * tint_green (Green-tinted (50%))

=item * tint_magenta (Magenta-tinted (50%))

=item * tint_orange (Orange-tinted (50%))

=item * tint_red (Red-tinted (50%))

=item * tint_yellow (Yellow-tinted (50%))

=back

=cut
