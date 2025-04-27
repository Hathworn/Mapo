#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_init(char* _ptr, char* end_ptr)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Exit if pointer exceeds end_ptr
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int p1 = 1;
    // Loop unrolling for efficiency
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i += 16) {
        unsigned int p2 = ~p1;

        #pragma unroll
        for (unsigned int j = 0; j < 16; j++) {
            ptr[i + j] = (j % 4 < 2) ? p1 : p2;
        }

        p1 = p1 << 1;
        // Reset p1 if zero
        if (p1 == 0) {
            p1 = 1;
        }
    }
}