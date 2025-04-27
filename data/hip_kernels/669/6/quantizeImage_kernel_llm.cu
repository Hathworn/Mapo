#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void quantizeImage_kernel(uint width, uint height, uint nbins, float* devInput, int* devOutput) {
    // Use shared memory to reduce global memory access
    extern __shared__ float sharedInput[];

    int x0 = blockDim.x * blockIdx.x + threadIdx.x;
    int y0 = blockDim.y * blockIdx.y + threadIdx.y;

    // Load input into shared memory
    if ((x0 < width) && (y0 < height)) {
        int index = y0 * width + x0;
        sharedInput[threadIdx.y * blockDim.x + threadIdx.x] = devInput[index];
    }
    __syncthreads();

    // Perform quantization using shared memory
    if ((x0 < width) && (y0 < height)) {
        int index = y0 * width + x0;
        float input = sharedInput[threadIdx.y * blockDim.x + threadIdx.x];
        int output = (int)floorf(input * (float)nbins);
        
        // Optimize the output calculation
        devOutput[index] = min(output, nbins - 1);
    }
}