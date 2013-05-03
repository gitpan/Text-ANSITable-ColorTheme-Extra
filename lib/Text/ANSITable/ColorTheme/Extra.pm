package Text::ANSITable::ColorTheme::Extra;

use 5.010001;
use strict;
use warnings;

use SHARYANTO::Color::Util qw(rgb2grayscale rgb2sepia reverse_rgb_color);
require Text::ANSITable::ColorTheme::Default;
require Text::ANSITable::ColorThemeUtil;

our $VERSION = '0.07'; # VERSION

my $defct = $Text::ANSITable::ColorTheme::Default::color_themes{default_gradation};

our %color_themes = ();

{
    my $ct = Text::ANSITable::ColorThemeUtil::derive_theme_transform_rgb($defct, sub { rgb2grayscale(shift) });
    $ct->{summary} = 'Grayscale';
    $color_themes{grayscale} = $ct;
}

{
    my $ct = Text::ANSITable::ColorThemeUtil::derive_theme_transform_rgb($defct, sub { rgb2sepia(shift) });
    $ct->{summary} = 'Sepia tone';
    $color_themes{sepia} = $ct;
}

{
    my $ct = Text::ANSITable::ColorThemeUtil::derive_theme_transform_rgb($defct, sub { reverse_rgb_color(shift) });
    $ct->{summary} = 'Reverse';
    $color_themes{reverse} = $ct;
}

1;
# ABSTRACT: More color themes

__END__
=pod

=encoding utf-8

=head1 NAME

Text::ANSITable::ColorTheme::Extra - More color themes

=head1 VERSION

version 0.07

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 DESCRIPTION

=head1 FUNCTIONS


None are exported by default, but they are exportable.

=head1 INCLUDED COLOR THEMES

=over

=item * grayscale (Grayscale)

=item * reverse (Reverse)

=item * sepia (Sepia tone)

=back

=cut

