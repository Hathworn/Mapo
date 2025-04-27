#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_fmod(int n, double *result, double *x, double *y) {
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x + 
             (blockIdx.y * blockDim.x * gridDim.x) + 
             (threadIdx.y * gridDim.x * blockDim.x);
    
    // Compute fmod only for valid indices
    if (id < n) {
        result[id] = fmod(x[id], y[id]);
    }
}