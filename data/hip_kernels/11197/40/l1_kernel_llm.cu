#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for fast access in threads within a block
    extern __shared__ float s_pred[];
    extern __shared__ float s_truth[];
    
    if (i < n) {
        s_pred[threadIdx.x] = pred[i];
        s_truth[threadIdx.x] = truth[i];
        __syncthreads();  // Synchronize threads within a block

        float diff = s_truth[threadIdx.x] - s_pred[threadIdx.x];
        error[i] = fabsf(diff);  // Use fabsf for performance
        delta[i] = copysignf(1.0f, diff);  // Use copysign for simplicity
    }
}