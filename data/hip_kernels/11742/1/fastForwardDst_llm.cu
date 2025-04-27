#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize the kernel for better performance and readability
__global__ void fastForwardDst(const int16_t* __restrict__ block, int16_t* __restrict__ coeff, int shift) 
{
    int i = threadIdx.x;
    int rnd_factor = 1 << (shift - 1);
    
    // Use registers for intermediate calculations
    int block0 = block[4 * i + 0];
    int block1 = block[4 * i + 1];
    int block2 = block[4 * i + 2];
    int block3 = block[4 * i + 3];

    int c0 = block0 + block3;
    int c1 = block1 + block3;
    int c2 = block0 - block1;
    int c3 = 74 * block2;

    // Compute coefficients using registers
    coeff[i] = (int16_t)((29 * c0 + 55 * c1 + c3 + rnd_factor) >> shift);
    coeff[4 + i] = (int16_t)((74 * (block0 + block1 - block3) + rnd_factor) >> shift);
    coeff[8 + i] = (int16_t)((29 * c2 + 55 * c0 - c3 + rnd_factor) >> shift);
    coeff[12 + i] = (int16_t)((55 * c2 - 29 * c1 + c3 + rnd_factor) >> shift);
}