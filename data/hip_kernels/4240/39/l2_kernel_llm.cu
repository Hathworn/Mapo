#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize thread index calculation

    if(i < n){
        float diff = truth[i] - pred[i];
        error[i] = diff * diff; // Calculate the squared error
        delta[i] = diff; // Store the difference
    }
}