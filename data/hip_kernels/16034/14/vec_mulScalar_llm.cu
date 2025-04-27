#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING : device_sum size should be gridDim.x
__global__ void vec_mulScalar(int n, double *result, double *x, double y) {
    // Combining thread and block indices to calculate the global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * gridDim.x * blockDim.x * blockDim.y) + threadIdx.y * blockDim.x;
    
    if (id < n) {
        // Perform vector-scalar multiplication
        result[id] = x[id] * y;
    }
}