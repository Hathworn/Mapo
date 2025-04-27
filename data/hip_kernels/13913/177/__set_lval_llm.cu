#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __set_lval(long long *A, long long val, int length) {
    // Calculate global thread index
    int ip = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Use stride for better occupancy and avoid warp divergence
    int stride = blockDim.x * gridDim.x * gridDim.y;

    // Loop with updated stride logic
    for (int i = ip; i < length; i += stride) {
        A[i] = val;
    }
}