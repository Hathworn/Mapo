#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Use shared memory to minimize global memory access latency
    __shared__ float shared_pred[256];
    __shared__ float shared_truth[256];

    int tid = threadIdx.x;
    int global_index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + tid;

    if (global_index < n) {
        // Load data into shared memory
        shared_pred[tid] = pred[global_index];
        shared_truth[tid] = truth[global_index];
        
        __syncthreads(); // Ensure all threads have loaded their data

        float diff = shared_truth[tid] - shared_pred[tid];
        error[global_index] = diff * diff;
        delta[global_index] = diff;
    }
}