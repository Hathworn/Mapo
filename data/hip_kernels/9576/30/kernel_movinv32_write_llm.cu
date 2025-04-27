```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int i = threadIdx.x; // Utilize threads within the block
    unsigned int k = offset + i;  // Compute the initial k value for the thread
    unsigned int pat = pattern;

    if (i < BLOCKSIZE / sizeof(unsigned int)) {
        if (k >= 32) {
            k = 0;
            pat = lb;
        } else {
            pat = pat << k;  // Shift pattern by k positions initially
            unsigned int temp_pat = pat;
            for (unsigned int j = 0; j < i; j++) {
                temp_pat = temp_pat << 1;
                temp_pat |= sval;
            }
            ptr[i] = temp_pat;
        }
    }
}