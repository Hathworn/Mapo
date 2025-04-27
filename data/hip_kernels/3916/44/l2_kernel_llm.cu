#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // 1D grid, flattened for simpler calculation
    if(i < n){
        float diff = truth[i] - pred[i];
        error[i] = diff * diff; // Error calculated as squared difference
        delta[i] = diff; // Difference stored in delta
    }
}