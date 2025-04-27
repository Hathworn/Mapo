#include "hip/hip_runtime.h"
#include "includes.h"

long kMod = 1000000007;

__global__ void prepareData(int *dp, int n) {
    int idx_x = blockIdx.x * blockDim.x + threadIdx.x; // Calculate x index
    int idx_y = blockIdx.y * blockDim.y + threadIdx.y; // Calculate y index
    if (idx_x < n && idx_y < n) { // Check bounds
        dp[idx_x * n + idx_y] = 0; // Assign value
    }
}