package BlogEntryAllCount::Tags;
use strict;
use warnings;
use MT::Entry;

sub _hdlr_blogentryallcount {
    my ( $ctx, $args ) = @_;
    my $class_type = $args->{class_type} || 'entry';
    my $class = MT->model($class_type);
    my ( %terms, %args );
    $ctx->set_blog_load_context( $args, \%terms, \%args )
        or return $ctx->error( $ctx->errstr );
    my $count = $class->count( \%terms, \%args );
    return $ctx->count_format( $count, $args );
}

1;