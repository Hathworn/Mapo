#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expKernel(float* Z, float* A, int size) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid-stride loop to ensure efficient processing of larger data sizes
    for (int i = id; i < size; i += blockDim.x * gridDim.x) {
        A[i] = __expf(-Z[i]);
    }
}