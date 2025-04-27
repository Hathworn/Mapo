#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CopyChannel_i_Kernel(float* output, const float* input, const int i, const int width, const int height, const int nChannels)
{
    // Calculate index for 1D traversal to maximize coalesced memory access
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Define total number of elements to process
    int totalElements = width * height;

    // Process elements by stride of blockDim.x * gridDim.x for efficient workload distribution
    for (int strideIndex = index; strideIndex < totalElements; strideIndex += blockDim.x * gridDim.x) {
        // Calculate 2D coordinates from the 1D index
        int x = strideIndex % width;
        int y = strideIndex / width;

        // Calculate offset for the current pixel
        int offset = y * width + x;

        // Copy the specific channel 'i' from input to output
        output[offset] = input[offset * nChannels + i];
    }
}