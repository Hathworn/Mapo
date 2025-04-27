#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void suma(int a, int b, int *c){
    // Use shared memory to store the result
    __shared__ int temp;
    if (threadIdx.x == 0) {
        temp = a + b;
    }
    __syncthreads();
    
    // Write result to global memory with a single thread
    if (threadIdx.x == 0) {
        *c = temp;
    }
}