#!/usr/bin/perl
#use warnings;
#use POSIX;
#use Getopt::Long;
#our $options =();

my @block_size = ('64', '32');
my @L1associativity_i = ('16', '8','4','2','1');

my @L1associativity_d = ('16', '8','4','2','1');

my @L2associativity1 = ('1', '2');

my $l1i_size1 = ("32kB", "64kB", "128kB");

my $l1d_size1 = ("32kB", "64kB", "128kB");

my $cputype="timing";

my $L2_size="1MB";

my $run1 = "";

foreach my $block_size (@block_size1)
{
    foreach my $L1associativity_i1 (@L1associativity_i){
        foreach my $L1associativity_d1 (@L1associativity_d)
        {
            foreach my $L2associativity2 (@L2associativity1)
            {
                foreach my $l1i_size (@l1i_size1)
                {
                    foreach my $l1d_size1 (@l1d_size1){
                        $run1 = "/home/010/a/ax/axn210126/ca-project/build/X86/gem5.opt -d /home/010/a/ax/axn210126/ca-project/m5out/429.mcf/m5out /home/010/a/ax/axn210126/ca-project/configs/example/se.py -c /home/010/a/ax/axn210126/ca-project/m5out/429.mcf/src/benchmark -o /home/010/a/ax/axn210126/ca-project/m5out/429.mcf/data/inp.in -I 500000000 --cpu-type=$cputype --caches --l2cache --l1i_size=$l1i_size1 --l1d_size=$l1d_size1 --l2_size=$L2_size --l1i_assoc=$L1associativity_i1 --l1d_assoc=$L1associativity_d1 --l2_assoc=1 --cacheline_size=64";
                        system($run1);
                        system ("cp /home/010/a/ax/axn210126/ca-project/m5out/429.mcf/m5out/stats.txt /home/010/a/ax/axn210126/ca-project/m5out/429.mcf/data_${block_size}_${L1associativity_i1}_${L1associativity_d1}_${L2associativity2}_${l1i_size1}_${l1d_size1}_l2_1.txt");
                    }
                }
            }
        }
    }
}
