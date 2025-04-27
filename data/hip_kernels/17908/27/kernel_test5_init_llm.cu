#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_init(char* _ptr, char* end_ptr)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    
    // Early exit if block is beyond end_ptr
    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }
    
    unsigned int p1 = 1;
    // Loop unrolling to reduce loop overhead
    for (unsigned int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i += 16) {
        unsigned int p2 = ~p1;
        
        #pragma unroll
        for (unsigned int j = 0; j < 16; j += 4) {
            ptr[i + j] = p1;
            ptr[i + j + 1] = p1;
            ptr[i + j + 2] = p2;
            ptr[i + j + 3] = p2;
        }

        // Optimize bit shifting by using a mask
        p1 = (p1 << 1) | (p1 >> (31));
    }
}