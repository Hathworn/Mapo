#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void getPos(const int * __restrict__ d_scanArray, const int d_numberOfElements, int * __restrict__ d_lastPos)
{
    // Use shared memory for reduced latency access
    extern __shared__ int sharedMem[];
    
    // Only one thread accesses the last position
    if (threadIdx.x == 0) {
        // Read the last element into shared memory
        sharedMem[0] = d_scanArray[d_numberOfElements - 1];
    }
    __syncthreads();
    
    // Write the value from shared memory to the output
    if (threadIdx.x == 0) {
        *d_lastPos = sharedMem[0];
    }
}