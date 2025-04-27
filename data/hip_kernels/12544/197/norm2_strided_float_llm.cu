#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void norm2_strided_float(int n, int xOffset, float *dx, int incx, float result) {
    // Use shared memory to accumulate results for optimal parallel reduction
    extern __shared__ float shared_result[];
    int tid = threadIdx.x;
    shared_result[tid] = 0.0;

    for (int i = blockIdx.x * blockDim.x + tid; i < n; i += blockDim.x * gridDim.x) {
        if (i >= xOffset && (i - xOffset) % incx == 0) {
            shared_result[tid] += powf(dx[i], 2);
        }
    }

    __syncthreads();

    // Perform reduction within each block
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (tid < stride) {
            shared_result[tid] += shared_result[tid + stride];
        }
        __syncthreads();
    }

    // Accumulate result from this block
    if (tid == 0) {
        atomicAdd(&result, shared_result[0]);
    }
}