#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_copyUpperSymmetric(float *input, int n, int len)
{
    // Calculate global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Loop across threads by striding with grid size
    while (idx < len) {
        const int r = idx % n;
        const int c = idx / n;
        if (r > c) {
            input[idx] = input[r * n + c];
        }
        // Update index by total number of threads
        idx += blockDim.x * gridDim.x;
    }
}