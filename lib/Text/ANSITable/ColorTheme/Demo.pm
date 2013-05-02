package Text::ANSITable::ColorTheme::Demo;

use 5.010;
use strict;
use warnings;

use Data::Clone;
use SHARYANTO::Color::Util qw(rand_rgb_color mix_2_rgb_colors);
use Text::ANSITable::ColorTheme::Default ();

our $VERSION = '0.05'; # VERSION

our %color_themes = ();

my $ct = clone $Text::ANSITable::ColorTheme::Default::color_themes{default_nogradation};

$ct->{summary} = 'Demoes coderef in item color';
$ct->{description} = <<'_';

Accept arguments C<border1> and C<border2> to set range of random colors.
Otherwise full range (000000-ffffff) is used.

Also accepts C<border1_bg> and C<border2_bg> to set random background RGB
colors.

_
$ct->{colors}{border} = sub {
    my ($self, %args) = @_;
    my $rgbf1 = $self->{color_theme_args}{border1};
    my $rgbf2 = $self->{color_theme_args}{border2};
    my $rgbf = rand_rgb_color($rgbf1, $rgbf2);
    my $rgbb1 = $self->{color_theme_args}{border1_bg};
    my $rgbb2 = $self->{color_theme_args}{border2_bg};
    my $rgbb;
    if ($rgbb1 && $rgbb2) {
        $rgbb = rand_rgb_color($rgbb1, $rgbb2);
    }
    [$rgbf, $rgbb];
};

$color_themes{demo_random_border_color} = $ct;

1;
# ABSTRACT: Demo color themes


__END__
=pod

=encoding utf-8

=head1 NAME

Text::ANSITable::ColorTheme::Demo - Demo color themes

=head1 VERSION

version 0.05

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

=item * demo_random_border_color (Demoes coderef in item color)


Accept arguments C<border1> and C<border2> to set range of random colors.
Otherwise full range (000000-ffffff) is used.

Also accepts C<border1_bg> and C<border2_bg> to set random background RGB
colors.



=back

=cut

