package Text::ANSITable::ColorTheme::Extra;

use 5.010001;
use strict;
use warnings;

use SHARYANTO::Color::Util qw(rgb2grayscale rgb2sepia reverse_rgb_color);
use SHARYANTO::ColorTheme::Util qw(create_color_theme_transform);
require Text::ANSITable;

our $VERSION = '0.13'; # VERSION

my $defct = Text::ANSITable->get_color_theme("Default::default_gradation");

our %color_themes = ();

{
    my $ct = create_color_theme_transform($defct, sub { rgb2grayscale(shift) });
    $ct->{v} = 1.1;
    $ct->{summary} = 'Grayscale';
    $color_themes{grayscale} = $ct;
}

{
    my $ct = create_color_theme_transform($defct, sub { rgb2sepia(shift) });
    $ct->{v} = 1.1;
    $ct->{summary} = 'Sepia tone';
    $color_themes{sepia} = $ct;
}

{
    my $ct = create_color_theme_transform($defct, sub { reverse_rgb_color(shift) });
    $ct->{v} = 1.1;
    $ct->{summary} = 'Reverse';
    $color_themes{reverse} = $ct;
}

1;
# ABSTRACT: More color themes

__END__

=pod

=encoding UTF-8

=head1 NAME

Text::ANSITable::ColorTheme::Extra - More color themes

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

=item * grayscale (Grayscale)

=item * reverse (Reverse)

=item * sepia (Sepia tone)

=back

=cut
