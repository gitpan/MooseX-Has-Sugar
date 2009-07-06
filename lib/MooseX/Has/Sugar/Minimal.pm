package MooseX::Has::Sugar::Minimal;
our $VERSION = '0.0404';


# ABSTRACT: Less Sugary Syntax for moose 'has' fields

use warnings;
use strict;

use Sub::Exporter ();

Sub::Exporter::setup_exporter(
    {
        exports => [ 'ro', 'rw', 'bare', ],
        groups  => {
            is      => [ 'ro', 'rw', 'bare', ],
            default => ['-is'],
        }
    }
);

sub bare() {
    return ('bare');
}

sub ro() {
    return ('ro');
}

sub rw() {
    return ('rw');
}

1;




=pod

=head1 NAME

MooseX::Has::Sugar::Minimal - Less Sugary Syntax for moose 'has' fields

=head1 VERSION

version 0.0404

=head1 SYNOPSIS

This is a legacy variant of L<MooseX::Has::Sugar> which only exports C<ro>
and C<rw> functions, the way L<MooseX::Has::Sugar> used to with C<:is>;

    use MooseX::Types::Moose qw( Str );
    use MooseX::Has::Sugar::Minimal;

    has foo => (
            isa => Str,
            is  => ro,
            required => 1,
    );
    has bar => (
            isa => Str,
            is => rw,
            lazy_build => 1,
    );

=head1 EXPORT

=over 4

=item rw

=item ro

=item bare

=back

=head1 EXPORT GROUPS

=over 4

=item :default

Exports C<:is>

=item :is

Exports C<ro> and C<rw> and C<bare>

=back

=head1 CONFLICTS

This module is not intended to be used in conjunction with
 L<MooseX::Has::Sugar>.

We both export C<ro> and C<rw> in different ways.

If you do however want to use them in conjuction, specific imports must
 be done on L<MooseX::Has::Sugar>'s side to stop it exporting different
 ro/rw. Any of the below should be fine.

    use MooseX::Has::Sugar::Minimal;
    use MooseX::Has::Sugar qw( :attrs );

    has foo =>( is => rw , lazy_build );

    use MooseX::Has::Sugar::Minimal;
    use MooseX::Has::Sugar qw( lazy_build );

    has foo =>( is => rw , lazy_build );

=head1 FUNCTIONS

These you probably don't care about, they're all managed by L<Sub::Exporter>
 and its stuff anyway.

=over 4

=item rw

returns C<('rw')>

=item ro

returns C<('ro')>

=item bare

returns C<('bare')>

=back

=head1 BUGS

Please report any bugs or feature requests to
C<bug-moosex-has-extras at rt.cpan.org>
or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MooseX-Has-Sugar>.

I will be notified, and then you'll automatically be notified of progress
 on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc MooseX::Has::Sugar::Minimal

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=MooseX-Has-Sugar>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/MooseX-Has-Sugar>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/MooseX-Has-Sugar>

=item * Search CPAN

L<http://search.cpan.org/dist/MooseX-Has-Sugar/>

=back

=head1 ACKNOWLEDGEMENTS

=head1 AUTHOR

  Kent Fredric <kentnl at cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut



__END__

