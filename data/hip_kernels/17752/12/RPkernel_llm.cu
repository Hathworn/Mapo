#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RPkernel(int k, int n, float* sub_searchPoints, float* referencePoints, float* dist)
{
    extern __shared__ float s_searchPoints[]; // Shared memory for sub_searchPoints
    
    // Load sub_searchPoints to shared memory
    if (threadIdx.x < k) {
        s_searchPoints[threadIdx.x] = sub_searchPoints[threadIdx.x];
    }
    __syncthreads(); // Ensure all threads have loaded sub_searchPoints

    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    if (tid < n) {
        float diff, squareSum = 0.0f;

        // Loop unrolling for improved performance
        for (int i = 0; i < k; i += 4) {
            diff = s_searchPoints[i] - referencePoints[k * tid + i];
            squareSum += diff * diff;
            if (i + 1 < k) {
                diff = s_searchPoints[i + 1] - referencePoints[k * tid + i + 1];
                squareSum += diff * diff;
            }
            if (i + 2 < k) {
                diff = s_searchPoints[i + 2] - referencePoints[k * tid + i + 2];
                squareSum += diff * diff;
            }
            if (i + 3 < k) {
                diff = s_searchPoints[i + 3] - referencePoints[k * tid + i + 3];
                squareSum += diff * diff;
            }
        }
        dist[tid] = squareSum;
    }
}