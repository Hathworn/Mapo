#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    unsigned int* ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);

    // Exit if pointer is outside bounds
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    unsigned int idx = threadIdx.x; // Use thread index for improved parallelism
    unsigned int pat = pattern;
    unsigned int k = (offset + idx) % 32; // Calculate initial k based on thread index

    // Calculate the pattern based on idx to avoid divergence
    for (unsigned int i = idx; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
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

    return;
}