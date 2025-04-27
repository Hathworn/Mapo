#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void wgan_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate thread's global index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Parallelize computations for each valid index
    if(i < n) {
        float truth_val = truth[i];
        
        // Simplify error computation
        error[i] = truth_val ? -pred[i] : pred[i];
        
        // Optimize delta calculation
        delta[i] = truth_val > 0 ? 1.0f : -1.0f;
    }
}