#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int addem(int a, int b) {
    return a + b;
}

__global__ void add(int a, int b, int *c) {
    // Utilize shared memory for faster access
    __shared__ int temp;
    
    if (threadIdx.x == 0) {
        temp = addem(a, b);
    }
    
    // Ensure all threads sync here before writing to global memory
    __syncthreads();
    
    if (threadIdx.x == 0) {
        *c = temp;
    }
}