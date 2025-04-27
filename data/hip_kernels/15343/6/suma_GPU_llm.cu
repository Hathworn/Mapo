#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void suma_GPU(int a, int b, int *c)
{
    // Using shared memory for potential reuse
    __shared__ int temp;
    if (threadIdx.x == 0) {
        temp = a + b; // Perform computation
    }
    __syncthreads();
    
    // Assign result to output pointer
    if (threadIdx.x == 0) {
        *c = temp;
    }
}