#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Laplacian_Kernel(float* output, const float* input, const int width, const int height, const int nChannels)
{
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;

    if (x >= width || y >= height)
        return;
    
    int offset = y * width + x;

    // Use shared memory for better memory coalescing for input values
    extern __shared__ float sharedMem[];
    int sharedOffset = threadIdx.y * blockDim.x + threadIdx.x;

    // Load input data into shared memory
    for (int c = 0; c < nChannels; c++)
        sharedMem[sharedOffset * nChannels + c] = input[offset * nChannels + c];
    __syncthreads();

    float value;
    for (int c = 0; c < nChannels; c++)
    {
        value = 0.0f;
        
        // Using ternary operations for boundary checks
        value += (x < width - 1 ? sharedMem[(sharedOffset + 1) * nChannels + c] : 0.0f)
               + (x > 0 ? sharedMem[(sharedOffset - 1) * nChannels + c] : 0.0f)
               - 2 * sharedMem[sharedOffset * nChannels + c];

        value += (y < height - 1 ? sharedMem[(sharedOffset + blockDim.x) * nChannels + c] : 0.0f)
               + (y > 0 ? sharedMem[(sharedOffset - blockDim.x) * nChannels + c] : 0.0f)
               - 2 * sharedMem[sharedOffset * nChannels + c];

        output[offset * nChannels + c] = value;
    }
}