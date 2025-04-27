```cuda
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bin(unsigned short *d_input, float *d_output, int in_nsamp) {

    // Calculate output and input indices for reading/writing
    int c = blockIdx.y * BINDIVINF + threadIdx.y;
    int t_out = blockIdx.x * BINDIVINT + threadIdx.x;
    int t_in = 2 * t_out;

    // Pre-calculate output sample size
    int out_nsamp = in_nsamp / 2;

    // Calculate flat memory indices for output and input
    size_t shift_one = c * out_nsamp + t_out;
    size_t shift_two = c * in_nsamp + t_in;

    // Load input data, compute the average, store to output
    d_output[shift_one] = (float)(d_input[shift_two] + d_input[shift_two + 1]) * 0.5f;

}