#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(int *dest, int a, int b) {
    // Utilize block and thread indexing for scaling
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) { // Only the first thread computes the result
        *dest = a + b;
    }   
}