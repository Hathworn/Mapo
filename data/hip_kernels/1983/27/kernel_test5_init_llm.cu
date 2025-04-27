#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_test5_init(char* _ptr, char* end_ptr)
{
    // Calculate the starting index for this block
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    // Check if the pointer is beyond the end pointer
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }
    
    unsigned int p1 = 1;

    // Loop unrolling for improved performance
    #pragma unroll
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i += 16) {
        unsigned int p2 = ~p1;

        // Store data in chunks
        ptr[i] = p1; ptr[i+1] = p1; ptr[i+2] = p2; ptr[i+3] = p2;
        ptr[i+4] = p1; ptr[i+5] = p1; ptr[i+6] = p2; ptr[i+7] = p2;
        ptr[i+8] = p1; ptr[i+9] = p1; ptr[i+10] = p2; ptr[i+11] = p2;
        ptr[i+12] = p1; ptr[i+13] = p1; ptr[i+14] = p2; ptr[i+15] = p2;

        // Update p1 and reset if it becomes zero
        p1 = (p1 << 1) | (p1 == 0);
    }
}