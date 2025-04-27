#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_test5_init(char* _ptr, char* end_ptr)
{
    // Improved memory alignment and coalescing for better performance
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);

    if (ptr >= (unsigned int*) end_ptr) {
        return;
    }

    // Use threadIdx for better parallelism
    unsigned int p1 = 1;
    for (int i = 0; i < BLOCKSIZE / sizeof(unsigned int); i += blockDim.x * 16) {
        for (int j = threadIdx.x; j < 16; j += blockDim.x) {
            unsigned int p2 = ~p1;
            ptr[i + j] = ((j & 1) == 0) ? p1 : p2;
        }
        
        __syncthreads();  // Synchronize threads within block

        if (threadIdx.x == 0) { // Only thread 0 updates p1 to reduce redundant calculations
            p1 <<= 1;
            if (p1 == 0) {
                p1 = 1;
            }
        }
        
        __syncthreads();  // Ensure p1 update is visible to all threads
    }
}