#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Use shared memory to cache pattern updates
    __shared__ unsigned int shared_pattern;

    unsigned int k = offset;
    shared_pattern = pattern;  // Initialize shared pattern

    unsigned int i = threadIdx.x;
    unsigned int stride = blockDim.x;

    // Loop with stride of block size for possible unroll by compiler
    for (; i < BLOCKSIZE / sizeof(unsigned int); i += stride) {
        ptr[i] = shared_pattern;  // Write cached pattern
        k++;
        if (k >= 32) {
            k = 0;
            shared_pattern = lb;
        } else {
            shared_pattern = (shared_pattern << 1) | sval;  // Update pattern
        }
    }
}