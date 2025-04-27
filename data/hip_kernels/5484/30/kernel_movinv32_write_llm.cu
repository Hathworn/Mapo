#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset) {
    // Calculate the initial pointer for the current block
    unsigned int* ptr = (unsigned int*)(_ptr + blockIdx.x * BLOCKSIZE);

    // Terminate if the pointer is beyond the end
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }

    // Calculate thread-local indices and stride
    unsigned int tid = threadIdx.x;
    unsigned int stride = blockDim.x;

    // Initialize pattern variables
    unsigned int k = offset;
    unsigned pat = pattern;

    // Loop through with strided access for threading
    for (unsigned int i = tid; i < BLOCKSIZE / sizeof(unsigned int); i += stride) {
        ptr[i] = pat;
        k++;
        if (k >= 32) {
            k = 0;
            pat = lb;
        } else {
            pat = (pat << 1) | sval;
        }
    }
}