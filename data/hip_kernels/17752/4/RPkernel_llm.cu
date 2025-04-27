#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RPkernel(int k, int n, float* sub_searchPoints, float* referencePoints, float* dist)
{
    __shared__ float s_sub_searchPoints[1024]; // Use shared memory for better locality
    float diff, squareSum;

    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure threads within the block load `sub_searchPoints` into shared memory
    if (threadIdx.x < k) {
        s_sub_searchPoints[threadIdx.x] = sub_searchPoints[threadIdx.x];
    }
    __syncthreads(); // Synchronize to ensure all data is loaded before computation

    if (tid < n) {
        squareSum = 0.0f;
        for (int i = 0; i < k; i++) {
            diff = s_sub_searchPoints[i] - referencePoints[k * tid + i];
            squareSum += (diff * diff);
        }
        dist[tid] = squareSum;
    }
}