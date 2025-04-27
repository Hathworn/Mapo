#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Exit early if the starting address is beyond the end pointer
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int k = offset;
    unsigned pat = pattern;
    
    // Utilize threadIdx.x to avoid loop when accessing array elements
    unsigned int i = threadIdx.x * (BLOCKSIZE / sizeof(unsigned int) / blockDim.x);
    if (i < BLOCKSIZE / sizeof(unsigned int)) {
        ptr[i] = pat;
        k += i;
        
        // Calculate new pattern
        if (k >= 32) {
            pat = lb;
        } else {
            pat = (pat << i) | ((1 << i) - 1) & sval;
        }
    }
}