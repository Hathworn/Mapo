#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void add(int a, int b, int *c) 
{
    // Use shared memory to reduce device memory access time
    extern __shared__ int sharedMem[];
    int threadId = threadIdx.x;

    // Store data in shared memory
    if (threadId == 0) {
        sharedMem[0] = a;
        sharedMem[1] = b;
    }

    // Synchronize threads to ensure shared memory is ready
    __syncthreads();

    // Each block calculates a sum independently
    if (threadId == 0) {
        *c = sharedMem[0] + sharedMem[1];
    }
}