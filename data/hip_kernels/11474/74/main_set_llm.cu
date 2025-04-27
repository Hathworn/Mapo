#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void main_set(float *data, float val) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Use block index for better scalability
    data[idx] = val;  // Assign value to correct index in array
}