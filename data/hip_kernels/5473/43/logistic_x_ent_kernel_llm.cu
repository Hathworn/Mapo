#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Use shared memory for improved memory access performance
    extern __shared__ float shared_mem[];
    float *shared_pred = shared_mem;
    float *shared_truth = shared_mem + blockDim.x;
    
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    
    // Load data into shared memory
    if (i < n) {
        shared_pred[threadIdx.x] = pred[i];
        shared_truth[threadIdx.x] = truth[i];
    }
    __syncthreads();
    
    if(i < n){
        float t = shared_truth[threadIdx.x];
        float p = shared_pred[threadIdx.x];
        error[i] = -t * logf(p + 1e-7f) - (1 - t) * logf(1 - p + 1e-7f);
        delta[i] = t - p;
    }
}