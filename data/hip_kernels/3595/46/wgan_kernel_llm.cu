#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void wgan_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate the global thread index more concisely
    int i = (blockIdx.x * blockDim.x) + threadIdx.x;
    
    // Use a single condition to check if index is within bounds and execute operation
    if(i < n) {
        float t = truth[i];
        float p = pred[i];
        error[i] = t ? -p : p;
        delta[i] = t > 0 ? 1 : -1;
    }
}