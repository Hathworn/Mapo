#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    // Calculate thread-specific pointer offset
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE) + threadIdx.x;
    unsigned int stride = blockDim.x;

    // Return if starting ptr goes out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int k = offset + threadIdx.x;
    unsigned int pat = pattern;

    // Loop considering thread stride
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned int); i += stride) {
        // Writing pattern into memory
        ptr[i] = pat;
        k++;
        // Update pattern with wrap-around logic
        if (k >= 32) {
            k = 0;
            pat = lb;
        } else {
            pat = (pat << 1) | sval;
        }
    }
    return;
}