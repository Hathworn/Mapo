#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void prod_strided_float(int n, int xOffset, float *dx, int incx, float *result) {
    // Shared memory reduction
    __shared__ float partialProd[256];
    int tid = threadIdx.x;
    partialProd[tid] = 1.0f;

    // Compute product for each thread's segment
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        if (i >= xOffset && i % incx == 0) {
            partialProd[tid] *= dx[i];
        }
    }
    __syncthreads();

    // Warp-level reduction
    for (int offset = warpSize / 2; offset > 0; offset /= 2) {
        if (tid < offset) {
            partialProd[tid] *= partialProd[tid + offset];
        }
        __syncthreads();
    }

    // Write the result from the first thread of each block to global memory
    if (tid == 0) {
        atomicMul(result, partialProd[0]);
    }
}