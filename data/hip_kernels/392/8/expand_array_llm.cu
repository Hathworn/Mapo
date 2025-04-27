#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expand_array(unsigned char *d_in, unsigned char *d_out) {
    uint32_t offset = blockDim.x * blockIdx.x + threadIdx.x;

    // Pre-calculate index based on the offset
    unsigned char *input = &d_in[offset * 5];
    unsigned char *output = &d_out[offset * 6];

    // Efficient memory access with minimal operations
    unsigned char in0 = input[0];
    unsigned char in1 = input[1];
    unsigned char in2 = input[2];

    output[0] = in0 >> 4;
    output[1] = (in0 << 4) | (in1 >> 4);
    output[2] = (in1 << 4) | (in2 >> 4);
    output[3] = in2 & 0xF;
    output[4] = input[3];
    output[5] = input[4];
}