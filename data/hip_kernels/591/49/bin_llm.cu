#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bin(unsigned short *d_input, float *d_output, int in_nsamp) {

    // Calculate unique thread ID for flat 2D grid
    int threadIdX = blockIdx.x * blockDim.x + threadIdx.x;
    int threadIdY = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate indexes for input and output
    int out_nsamp = in_nsamp / 2;
    int t_out = threadIdX;
    int t_in = t_out * 2;
    size_t shift_one = threadIdY * out_nsamp + t_out;
    size_t shift_two = threadIdY * in_nsamp + t_in;

    // Perform binning, use shared memory for better performance if feasible
    d_output[shift_one] = (float)(d_input[shift_two] + d_input[shift_two + 1]) / 2.0f;
}