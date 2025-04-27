#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory to optimize data access and reduce global memory latency
__global__ void cuAddQNormAndSqrt(float *dist, int width, int pitch, float *q, int k) {
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int yIndex = blockIdx.y * blockDim.y + threadIdx.y;

    if (xIndex < width && yIndex < k) {
        // Load q[xIndex] into shared memory
        __shared__ float shared_q[256];  // Assumes blockDim.x <= 256, adjust as needed
        if (threadIdx.y == 0) {
            shared_q[threadIdx.x] = q[xIndex];
        }
        __syncthreads();

        // Use shared memory to perform the computation
        float q_value = shared_q[threadIdx.x];
        dist[yIndex * pitch + xIndex] = sqrt(dist[yIndex * pitch + xIndex] + q_value);
    }
}