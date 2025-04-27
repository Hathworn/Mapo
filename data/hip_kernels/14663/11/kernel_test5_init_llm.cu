#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_init(char* _ptr, char* end_ptr)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Check if kernel operation is out of bounds
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int p1 = 1;
    unsigned int p2; // Define p2 once

    // Unroll loop manually for optimization; avoid unnecessary calculations
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i += 16) {
        p2 = ~p1; // Compute p2 outside of storing to avoid repetition

        #pragma unroll // Suggest compiler to unroll loop for better performance
        for (int j = 0; j < 16; j += 4) { 
            ptr[i + j]     = (j % 8 < 4) ? p1 : p2;
            ptr[i + j + 1] = (j % 8 < 4) ? p1 : p2;
            ptr[i + j + 2] = (j % 8 < 4) ? p2 : p1;
            ptr[i + j + 3] = (j % 8 < 4) ? p2 : p1;
        }

        p1 = p1 << 1; // Increment p1
        if (p1 == 0) {
            p1 = 1; // Reset p1
        }
    }
}