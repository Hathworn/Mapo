#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Terminate early if the start of this block is beyond the end pointer
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Calculate number of iterations needed, considering the end of data segment
    unsigned int iterCount = min(BLOCKSIZE / sizeof(unsigned int), 
                                 ((unsigned int*)end_ptr - ptr));

    unsigned int k = offset;
    unsigned pat = pattern;
    
    // Loop to write pattern as per logic
    for (unsigned int i = 0; i < iterCount; i++) {
        ptr[i] = pat;
        k++;

        // Use ternary operator for concise condition handling
        pat = (k >= 32) ? lb : ((pat << 1) | sval);
        k = (k >= 32) ? 0 : k;
    }
}