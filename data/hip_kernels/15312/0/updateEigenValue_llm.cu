#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void updateEigenValue(int* d_rowPtr, int* d_col, float* d_val, float* d_b, float* d_temp, float* d_normAb, float* d_alpha1, float* d_alpha2, int n)
{
    int index = threadIdx.x + blockDim.x * blockIdx.x;
    int stride = blockDim.x * gridDim.x;
    float t1 = 0.0f;
    float t2 = 0.0f;
    float t3 = 0.0f;

    // Utilize fewer reads and writes by incrementing stride in a single loop
    for (int idx = index; idx < n; idx += stride) {
        float tempVal = 0.0f;
        for (int i = d_rowPtr[idx]; i < d_rowPtr[idx + 1]; i++) {
            tempVal += d_val[i] * d_b[d_col[i]];
        }
        d_temp[idx] = tempVal;
        // Accumulate dot products
        t1 += tempVal * tempVal;
        t2 += d_b[idx] * tempVal;
        t3 += d_b[idx] * d_b[idx];
    }

    // Use block-level reduction for accumulating dot product results
    __shared__ float cache1[2];
    __shared__ float cache2[2];
    __shared__ float cache3[2];

    // Initialize shared memory
    cache1[threadIdx.x] = t1;
    cache2[threadIdx.x] = t2;
    cache3[threadIdx.x] = t3;

    __syncthreads();

    // Perform reduction (use loop unrolling for better efficiency if blockDim.x is a power of 2)
    for (int i = blockDim.x / 2; i > 0; i /= 2) {
        if (threadIdx.x < i) {
            cache1[threadIdx.x] += cache1[threadIdx.x + i];
            cache2[threadIdx.x] += cache2[threadIdx.x + i];
            cache3[threadIdx.x] += cache3[threadIdx.x + i];
        }
        __syncthreads();
    }

    // Accumulate results with atomic operations outside of reduction loop
    if (threadIdx.x == 0) {
        atomicAdd(d_normAb, cache1[0]);
        atomicAdd(d_alpha1, cache2[0]);
        atomicAdd(d_alpha2, cache3[0]);
    }
}