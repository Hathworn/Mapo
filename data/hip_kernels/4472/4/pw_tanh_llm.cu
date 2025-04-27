#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_tanh(float *y, float *a, int n) {
    // Use shared memory for faster access
    extern __shared__ float shared_a[];

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int tid = threadIdx.x;

    // Load data into shared memory
    if (i < n) {
        shared_a[tid] = a[i];
        __syncthreads();

        // Compute tanh using shared memory
        y[i] = tanh(shared_a[tid]);
    }
}