#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void wgan_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Use shared memory for faster access
    __shared__ float shared_pred[256];
    __shared__ float shared_truth[256];
    if (threadIdx.x < n) {
        shared_pred[threadIdx.x] = pred[threadIdx.x];
        shared_truth[threadIdx.x] = truth[threadIdx.x];
    }
    __syncthreads();

    // Check boundary condition
    if (i < n) {
        // Use ternary operator for concise code
        error[i] = shared_truth[i] ? -shared_pred[i] : shared_pred[i];
        delta[i] = (shared_truth[i] > 0) ? 1 : -1;
    }
}