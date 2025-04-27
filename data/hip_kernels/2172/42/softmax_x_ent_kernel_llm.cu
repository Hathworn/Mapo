#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation

    // Use shared memory to minimize global memory accesses
    __shared__ float shared_pred[256];  
    __shared__ float shared_truth[256];  

    if (i < n) {
        shared_pred[threadIdx.x] = pred[i];  
        shared_truth[threadIdx.x] = truth[i];  
        __syncthreads();  // Synchronize threads
        
        float t = shared_truth[threadIdx.x];
        float p = shared_pred[threadIdx.x];
        error[i] = (t) ? -log(p) : 0;  // Calculate error
        delta[i] = t - p;  // Calculate delta
    }
}