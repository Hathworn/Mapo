#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void aligned_access(float* a, int max) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use cooperative threads to fetch a whole warp at a time
    for (int i = idx; i < max; i += blockDim.x * gridDim.x) {
        a[i] = a[i] + 1.0f; // Improved memory coalescing
    }
}