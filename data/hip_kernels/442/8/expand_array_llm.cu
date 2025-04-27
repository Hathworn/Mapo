#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expand_array(unsigned char *d_in, unsigned char *d_out)
{
    // Calculate the unique thread offset for memory access
    uint32_t offset = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Calculate input and output pointers with scaled offset
    unsigned char *input = d_in + offset * 5;
    unsigned char *output = d_out + offset * 6;
    
    // Optimize memory operations by using unsigned char operations directly
    unsigned char temp0 = input[0];
    unsigned char temp1 = input[1];
    unsigned char temp2 = input[2];
    
    // Expanded array operations with reduced operations
    output[0] = temp0 >> 4;
    output[1] = (temp0 << 4) | (temp1 >> 4);
    output[2] = (temp1 << 4) | (temp2 >> 4);
    output[3] = temp2 & 0xf;
    output[4] = input[3];
    output[5] = input[4];
}