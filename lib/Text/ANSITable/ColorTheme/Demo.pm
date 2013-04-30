package Text::ANSITable::ColorTheme::Demo;

use 5.010;
use strict;
use warnings;

use SHARYANTO::Color::Util qw(rand_rgb_color mix_2_rgb_colors);

our $VERSION = '0.01'; # VERSION

our %color_themes = (

    demo_random_border_color => {
        summary => 'Demoes coderef in item color',
        description => <<'_',

Accept arguments C<border1> and C<border2> to set range of random colors.
Otherwise full range (000000-ffffff) is used.

_
        colors => {
            border => sub {
                my ($self, %args) = @_;
                my $rgb1 = $self->{color_theme_args}{border1};
                my $rgb2 = $self->{color_theme_args}{border2};
                rand_rgb_color($rgb1, $rgb2);
            },
        },
    },

    demo_gradation_border_color => {
        summary => 'Demoes coderef in item color',
        description => <<'_',

Accept arguments C<border1> and C<border2> to set first and second RGB colors.

_
        colors => {
            border => sub {
                my ($self, %args) = @_;

                my $rgb1 = $self->{color_theme_args}{border1} // 'ffffff';
                my $rgb2 = $self->{color_theme_args}{border2} // '444444';

                my $y;
                my $num_rows = @{$self->{_draw}{frows}};
                my $bcy = $args{bch}[0];
                if ($bcy == 0) {
                    $y = 0;
                } elsif ($bcy == 1) {
                    $y = 1;
                } elsif ($bcy == 2) {
                    $y = 2;
                } elsif ($bcy == 5) {
                    $y = $num_rows + 3;
                } else {
                    $y = $args{row_idx}+3;
                }

                my $rgb = mix_2_rgb_colors($rgb1, $rgb2, $y/($num_rows+3));
                #say "D:$rgb";
                $rgb;
            },
        },
    },

);

1;
# ABSTRACT: Demo color themes


__END__
=pod

=head1 NAME

Text::ANSITable::ColorTheme::Demo - Demo color themes

=head1 VERSION

version 0.01

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 FUNCTIONS

=head1 INCLUDED COLOR THEMES

=over

=item * demo_gradation_border_color (Demoes coderef in item color)


Accept arguments C<border1> and C<border2> to set first and second RGB colors.



=item * demo_random_border_color (Demoes coderef in item color)


Accept arguments C<border1> and C<border2> to set range of random colors.
Otherwise full range (000000-ffffff) is used.



=back

=cut

