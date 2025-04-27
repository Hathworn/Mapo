#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    // Calculate global thread index
    unsigned int global_tid = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int* ptr = (unsigned int*)(_ptr + global_tid * sizeof(unsigned int)); // Pointer arithmetic for the specific thread

    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    // Calculate the appropriate pattern shift and loop unrolling
    unsigned int k = offset + threadIdx.x * (BLOCKSIZE / blockDim.x) / sizeof(unsigned int);
    unsigned pat = pattern;
    unsigned int i;
    unsigned int stride = BLOCKSIZE / (sizeof(unsigned int) * blockDim.x); // Reduced calculations with stride

    for (i = 0; i < BLOCKSIZE / sizeof(unsigned int); i += stride) {
        // Unroll the loop to improve performance
        #pragma unroll
        for (unsigned int j = 0; j < stride; ++j) {
            ptr[i + j] = pat;
            k++;
            if (k >= 32) {
                k = 0;
                pat = lb;
            } else {
                pat = (pat << 1) | sval;
            }
        }
    }

    return;
}