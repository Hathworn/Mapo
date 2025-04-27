```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Use shared memory to improve performance by reducing global memory access
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + tid;

    if (i < n) {
        float diff = truth[i] - pred[i];
        float err = diff * diff;
        delta[i] = diff;
        error[i] = err; // Correct error calculation
        sdata[tid] = err;
    } else {
        sdata[tid] = 0.0f; // Zero out extra thread memory usage
    }

    __syncthreads();

    // Parallel reduction within block (sum the errors)
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write block error sum to global memory
    if (tid == 0) {
        error[blockIdx.x] = sdata[0];
    }
}