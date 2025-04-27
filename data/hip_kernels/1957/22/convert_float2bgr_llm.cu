#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void convert_float2bgr(float* annd, unsigned char* bgr, int w, int h, float minval, float maxval)
{
    // Calculate the row and column of the element
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if within image bounds
    if (x < w && y < h)
    {
        int id = y * w + x;

        // Streamline calculation, reduce function calls
        float normalizedValue = (annd[id] - minval) / (maxval - minval);
        normalizedValue = fmaxf(fminf(normalizedValue, 1.f), 0.f);

        // Directly assign to bgr with a single operation
        bgr[id] = static_cast<unsigned char>(normalizedValue * 255.f);
    }
}