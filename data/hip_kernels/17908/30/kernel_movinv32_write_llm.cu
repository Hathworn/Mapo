#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Exit early if out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int k = offset;
    unsigned int pat = pattern;

    // Use shared memory for faster access
    __shared__ unsigned int shared_pat[BLOCKSIZE / sizeof(unsigned int)];

    // Iterate using the thread index to process multiple elements per thread
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
        shared_pat[i] = pat;
        k++;
        if (k >= 32) {
            k = 0;
            pat = lb;
        } else {
            pat = pat << 1;
            pat |= sval;
        }
    }

    // Synchronize threads to ensure all shared memory writes are done
    __syncthreads();

    // Write back to global memory
    for (unsigned int i = threadIdx.x; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x) {
        ptr[i] = shared_pat[i];
    }
}