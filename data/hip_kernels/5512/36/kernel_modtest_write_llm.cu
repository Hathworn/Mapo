#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Check if the block's data region is valid
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Calculate the number of iterations before the loop
    unsigned int limit = BLOCKSIZE / sizeof(unsigned int);
    
    // Use fewer iterations for setting p1 and p2 to reduce overhead
    unsigned int i;
    for (i = offset; i < limit; i += MOD_SZ){
        ptr[i] = p1;
    }

    for (i = 0; i < limit; i++){
        if (i % MOD_SZ != offset){
            ptr[i] = p2;
        }
    }

    return;
}