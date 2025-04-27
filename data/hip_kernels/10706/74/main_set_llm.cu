#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel
__global__ void main_set(float *data, float val) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Compute global index
    data[idx] = val; // Assign value using global index
}