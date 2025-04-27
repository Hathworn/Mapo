```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    // Obtain global thread index
    unsigned int idx = blockIdx.x * BLOCKSIZE + threadIdx.x * sizeof(unsigned int);
    
    // Ensure we don't exceed the end_ptr
    if (idx >= (unsigned int*)end_ptr - (unsigned int*)_ptr) {
        return;
    }

    // Calculate starting pointer for this thread
    unsigned int* ptr = (unsigned int*)(_ptr + idx);

    // Initialize pat and k
    unsigned int k = offset + threadIdx.x * (BLOCKSIZE / sizeof(unsigned int));
    unsigned int pat = pattern;

    // Loop unrolling to improve performance
    #pragma unroll
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i++) {
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