#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCKSIZE 256 // Adjust according to your specific use-case
#define MOD_SZ 16     // Adjust according to your specific use-case

__global__ void kernel_modtest_write(char* _ptr, char* end_ptr, unsigned int offset, unsigned int p1, unsigned int p2)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Exit early if pointer exceeds end pointer
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Calculate valid index range and avoid repetitive division operations
    unsigned int num_elements = BLOCKSIZE / sizeof(unsigned int);
    
    // Write p1 at specific offsets within ptr array
    for (unsigned int i = offset; i < num_elements; i += MOD_SZ) {
        ptr[i] = p1;
    }

    // Write p2 at other positions while avoiding division by MOD_SZ multiple times
    for (unsigned int i = 0; i < num_elements; i++) {
        if (i % MOD_SZ != offset) {
            ptr[i] = p2;
        }
    }
}