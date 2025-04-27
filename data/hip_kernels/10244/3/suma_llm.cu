#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void suma(int a, int b, int *c) {
    // Calculate the linear index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Only thread 0 writes the result, preventing unnecessary threads
    if (idx == 0) {
        *c = a + b;
    }
}