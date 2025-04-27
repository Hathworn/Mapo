#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test5_init(char* _ptr, char* end_ptr)
{
    // Optimize the loop to reduce operations
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int p1 = 1;
    unsigned int p2;
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i += 16) {
        p2 = ~p1;

        // Use loop unrolling to reduce redundant code
        #pragma unroll
        for (int j = 0; j < 16; j += 2) {
            ptr[i + j]     = (j % 4 < 2) ? p1 : p2;
            ptr[i + j + 1] = (j % 4 < 2) ? p1 : p2;
        }

        // Update p1 efficiently outside the inner loop
        p1 <<= 1;
        if (p1 == 0) {
            p1 = 1;
        }
    }

    return;
}