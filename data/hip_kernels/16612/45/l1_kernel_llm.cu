#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize by skipping re-calculation of global index if using 1D grid (in most common cases)
    if(i < n){
        float diff = truth[i] - pred[i];
        error[i] = fabsf(diff); // use intrinsic fabsf for performance
        delta[i] = copysignf(1.0f, diff); // use copysignf function for cleaner logic
    }
}