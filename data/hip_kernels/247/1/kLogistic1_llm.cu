#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogistic1(float* gData, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for common data to improve speed (assuming blockDim.x fixed)
    __shared__ float sharedData[256];  // Adjust size based on blockDim.x if needed

    // Loop unrolling - process more than one element per iteration when possible
    for (unsigned int i = idx; i < numElements; i += blockDim.x * gridDim.x * 4) {
        if (i < numElements) {
            sharedData[threadIdx.x] = gData[i];
            target[i] = (1 + tanhf(sharedData[threadIdx.x] / 2)) / 2;
        }
        if (i + blockDim.x * gridDim.x < numElements) {
            sharedData[threadIdx.x] = gData[i + blockDim.x * gridDim.x];
            target[i + blockDim.x * gridDim.x] = (1 + tanhf(sharedData[threadIdx.x] / 2)) / 2;
        }
        if (i + 2 * blockDim.x * gridDim.x < numElements) {
            sharedData[threadIdx.x] = gData[i + 2 * blockDim.x * gridDim.x];
            target[i + 2 * blockDim.x * gridDim.x] = (1 + tanhf(sharedData[threadIdx.x] / 2)) / 2;
        }
        if (i + 3 * blockDim.x * gridDim.x < numElements) {
            sharedData[threadIdx.x] = gData[i + 3 * blockDim.x * gridDim.x];
            target[i + 3 * blockDim.x * gridDim.x] = (1 + tanhf(sharedData[threadIdx.x] / 2)) / 2;
        }
    }
}