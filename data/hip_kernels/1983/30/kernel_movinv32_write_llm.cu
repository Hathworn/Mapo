#include "hip/hip_runtime.h"
#include "includes.h"

// Global kernel function optimized for coalesced memory access
__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset) {
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Ensure we do not exceed the boundary
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int k = offset;
    unsigned int pat = pattern;
    unsigned int stride = BLOCKSIZE / sizeof(unsigned int);
    
    // Reduce loop iteration frequency for performance
    #pragma unroll
    for (unsigned int i = 0; i < stride; i++){
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