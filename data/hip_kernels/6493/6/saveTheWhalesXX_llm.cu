#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void saveTheWhalesXX (const int d0, const int d1, const int i2, float *xxx, const int d3, const int d4, const float *xx) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = threadIdx.y + blockDim.y * blockIdx.y;
    int gridStrideX = blockDim.x * gridDim.x;
    int gridStrideY = blockDim.y * gridDim.y;

    // Use grid-stride loop for better occupancy and scalability
    for (; i < d3; i += gridStrideX) {
        for (; j < d4; j += gridStrideY) {
            xxx[i + j * d0 + i2 * d0 * d1] = xx[i + j * d3];
        }
    }
}