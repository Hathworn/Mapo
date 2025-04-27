#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float sigmoid(float x) {
    return 1.0f / (1 + __expf(-x));
}

__global__ void initializeBiasKernel_sigmoid(float* b, int size) {
    // Use grid-stride loop for better utilization of GPU resources
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    for (int i = index; i < size; i += stride) {
        b[i] = 0.0;
    }
}