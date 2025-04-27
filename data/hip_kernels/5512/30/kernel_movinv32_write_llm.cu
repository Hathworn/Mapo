#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Early return if the start pointer is outside the valid range
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int index = threadIdx.x;
    unsigned int stride = blockDim.x;
    unsigned int k = offset + index;  // Adjust start position based on thread index
    unsigned int pat = pattern;

    // Unroll loop across threads in block to utilize warp and coalesced memory access
    for (unsigned int i = index; i < BLOCKSIZE / sizeof(unsigned int); i += stride) {
        ptr[i] = pat;
        k++;
        if (k >= 32) {
            k = 0;
            pat = lb;
        } else {
            pat = pat << 1;
            pat |= sval;
        }
    }
}