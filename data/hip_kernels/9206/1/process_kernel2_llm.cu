#include "hip/hip_runtime.h"
#include "includes.h"

// Device Function for process_kernel1

// Device Function for process_kernel2

// Device Function for process_kernel3

__global__ void process_kernel2(const float* input, float* output, int numElements) {
    // Calculate global thread ID using 3D block and thread index.
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x +
                         (blockIdx.y * blockDim.y + threadIdx.y) * gridDim.x * blockDim.x +
                         (blockIdx.z * blockDim.z + threadIdx.z) * (gridDim.x * gridDim.y * blockDim.x * blockDim.y);

    // Check within bounds and perform calculations
    if (globalThreadId < numElements) {
        output[globalThreadId] = (float)log(fabs(input[globalThreadId]));
    }
}