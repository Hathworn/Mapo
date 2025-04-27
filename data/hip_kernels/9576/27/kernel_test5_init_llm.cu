#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_init(char* _ptr, char* end_ptr)
{
    // Calculate global index
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Check if the pointer exceeds end_ptr
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Initialize p1 and precompute repeated pattern
    unsigned int p1 = 1;
    unsigned int pattern[16];

    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i += 16) {
        unsigned int p2 = ~p1;

        // Vectorize pattern initialization
        pattern[0] = p1;       pattern[1] = p1;
        pattern[2] = p2;       pattern[3] = p2;
        pattern[4] = p1;       pattern[5] = p1;
        pattern[6] = p2;       pattern[7] = p2;
        pattern[8] = p1;       pattern[9] = p1;
        pattern[10] = p2;      pattern[11] = p2;
        pattern[12] = p1;      pattern[13] = p1;
        pattern[14] = p2;      pattern[15] = p2;

        // Unroll the loop by assigning entire pattern at once
        for (unsigned int j = 0; j < 16; ++j) {
            ptr[i + j] = pattern[j];
        }

        p1 = p1 << 1;
        if (p1 == 0) {
            p1 = 1;
        }
    }

    return;
}