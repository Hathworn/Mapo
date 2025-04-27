#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_query_points_norm_and_sqrt(float * array, int width, int pitch, int k, float * norm) {
    // Calculate indices
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int yIndex = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds
    if (xIndex < width && yIndex < k) {
        // Use shared memory for norm to reduce memory accesses
        __shared__ float sharedNorm[blockDim.x];
        if (threadIdx.y == 0) {
            sharedNorm[threadIdx.x] = norm[xIndex];
        }
        __syncthreads();

        // Perform computation
        int index = yIndex * pitch + xIndex;
        array[index] = sqrt(array[index] + sharedNorm[threadIdx.x]);
    }
}