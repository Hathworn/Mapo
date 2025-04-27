#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Check if the starting pointer is out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int k = offset;
    unsigned int pat = pattern;

    // Use a single loop with memory coalescing optimization
    int i = threadIdx.x;
    int stride = blockDim.x;

    for (; i < BLOCKSIZE / sizeof(unsigned int); i += stride) {
        ptr[i] = pat;
        k++;
        // Calculate the new pattern value conditionally
        if (k >= 32) {
            k = 0;
            pat = lb;
        } else {
            pat = (pat << 1) | sval;
        }
    }
}