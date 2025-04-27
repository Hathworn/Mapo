```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogramm(float* hist, unsigned char* input, int width, int height, int stride)
{
    int index = blockIdx.x * blockDim.x * stride + threadIdx.x;
    int size = width * height;

    // Exit early if index is out of range
    if (index >= size)
        return;

    __shared__ unsigned int histo_private[256];

    // Initialize shared memory histogram to 0
    #pragma unroll
    for (int i = 0; i < 8; i++)
    {
        histo_private[threadIdx.x * 8 + i] = 0;
    }

    __syncthreads();

    // Process input and update the shared histogram
    while (index < size)
    {
        int pixel = input[index];
        atomicAdd(&(histo_private[pixel]), 1);
        index += blockDim.x * stride; // Correct stride calculation
    }

    __syncthreads();

    // Update global histogram using shared histogram
    #pragma unroll
    for (int i = 0; i < 8; i++)
    {
        int x_off = threadIdx.x * 8 + i;
        hist[x_off * 3 + 0] = (x_off - 128.f) / 256.f * (float)width;

        float factor = .48f;
        float scaledValue = ((float)(histo_private[x_off]) / (float)size) - (factor / gridDim.x);
        atomicAdd(&(hist[x_off * 3 + 1]), scaledValue * (float)height);
    }
}