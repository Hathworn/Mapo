#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void laplacian(float *dst, const float *src, const size_t width, const size_t height, const size_t pixelsPerThread)
{
    // Calculate global index
    const size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    const size_t col = index % width;
    const size_t crow = index / width * pixelsPerThread;

    // Boundary check
    if (col >= width || crow >= height)
        return;

    // Calculate start and end row for the current thread
    const size_t srow = crow + 1;
    const size_t erow = min(crow + pixelsPerThread - 1, height - 1);

    for (size_t row = crow; row <= erow; ++row)
    {
        const size_t idx = row * width + col;
        
        // Initialize with central pixel
        float value = src[idx] * 1.0f;

        // Subtract neighbors
        if (row + 1 < height) value -= 0.25f * src[idx + width]; // S
        if (row > 0)          value -= 0.25f * src[idx - width]; // N
        if (col + 1 < width)  value -= 0.25f * src[idx + 1];     // E
        if (col > 0)          value -= 0.25f * src[idx - 1];     // W

        // Store resulting value
        dst[idx] = value;
    }
}