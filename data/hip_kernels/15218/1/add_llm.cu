#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int *c)
{
    // Use shared memory to optimize data access
    extern __shared__ int shared_data[];
    shared_data[0] = a;
    shared_data[1] = b;
    __syncthreads();
    
    // Perform addition using shared memory data
    if (threadIdx.x == 0) {
        *c = shared_data[0] + shared_data[1];
    }
}