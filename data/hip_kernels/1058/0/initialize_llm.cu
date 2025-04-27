#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initialize(float* a, float* oA, float* x, float totalSize, int n, int ghosts) {
    int index = threadIdx.x + blockDim.x * blockIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride for grid parallelism
    for(int i = index; i < n + 2 * ghosts; i += stride) { // Use stride loop for better performance
        a[i] = 0;
        oA[i] = 0;
        x[i] = totalSize / n;
    }
}