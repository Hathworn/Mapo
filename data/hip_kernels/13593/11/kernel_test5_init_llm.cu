```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_init(char* _ptr, char* end_ptr)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Check if the pointer is out of bounds early
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    unsigned int p1 = 1;
    // Unroll the loop manually for better performance
    for (int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i += 16) {
        unsigned int p2 = ~p1;

        // Use a loop to reduce repetitive code
        for (int j = 0; j < 16; j += 4) {
            ptr[i + j] = p1;
            ptr[i + j + 1] = p1;
            ptr[i + j + 2] = p2;
            ptr[i + j + 3] = p2;
        }

        p1 <<= 1; // Use compound assignment for clarity
        p1 = (p1 == 0) ? 1 : p1; // Simplify p1 reset condition
    }
}