#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __set_val(double *A, double val, int length) {
    // Calculate flattened global index within the grid
    int i = threadIdx.x + blockDim.x * blockIdx.x + blockDim.x * gridDim.x * blockIdx.y;
    // Unroll loop to increase throughput
    for (; i < length; i += blockDim.x * gridDim.x * gridDim.y) {
        A[i] = val; 
    }
}