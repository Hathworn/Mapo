#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function with improved memory coalescing
__global__ void mean_kernel(int n, float* v1, float* v2, float* res){
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Loop through data with stride to improve occupancy
    for (int i = idx; i < n; i += stride) {
        res[i] = (v1[i] + v2[i]) * 0.5f; // Use multiplication for division by 2
    }
}