#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void expand_array(unsigned char *d_in, unsigned char *d_out)
{
    uint32_t offset = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned char *input = d_in + offset * 5;   // No need to multiply by sizeof(unsigned char)
    unsigned char *output = d_out + offset * 6; // No need to multiply by sizeof(unsigned char)

    // Use local variables to store intermediate results for better readability and potential optimizations
    unsigned char in0 = input[0];
    unsigned char in1 = input[1];
    unsigned char in2 = input[2];

    output[0] = in0 >> 4;
    output[1] = (in0 << 4) | (in1 >> 4);
    output[2] = (in1 << 4) | (in2 >> 4);
    output[3] = in2 & 0xf;
    output[4] = input[3];
    output[5] = input[4];
}