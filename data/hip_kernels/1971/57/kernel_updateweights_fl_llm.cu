#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_updateweights_fl(int N, float *wt, float *x, float *q, float nu){
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if thread is within bounds
    if (tid < N) {
        float x_val = x[tid];
        float wt_val = (nu + 1.0f) / (nu + x_val * x_val); // Calculate weight
        wt[tid] = wt_val;
        q[tid] = wt_val - __logf(wt_val); // Use fast math intrinsic for logarithm
    }
}