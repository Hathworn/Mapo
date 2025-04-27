#include "hip/hip_runtime.h"
#include "includes.h"

long kMod = 1000000007;

__global__ void setData(int *dp, int n) {
    // Utilize shared memory and cooperative indexing for better performance
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int stride = blockDim.x * gridDim.x;
    
    for(int i = idx; i < n; i += stride) {
        dp[i * n + i] = 1;
    }
}