#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    // Use shared memory to reduce global memory accesses
    extern __shared__ float s_data[];
    s_data[threadIdx.x] = 0.0f;

    // Accumulate values in shared memory
    for(int k = threadIdx.x; k < n; k += blockDim.x) {
        s_data[threadIdx.x] += x[k * groups + i];
    }

    // Reduce within block
    __syncthreads();
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            s_data[threadIdx.x] += s_data[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write result from shared memory to global memory
    if (threadIdx.x == 0) {
        sum[i] = s_data[0];
    }
}