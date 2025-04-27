#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSquantize_kernel(float* x, float* y, unsigned int size, float minVal, float maxVal, unsigned int quantizationLevels, bool truncate)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    if (quantizationLevels > 1) {
        const float scaling = (maxVal - minVal) / (float)(quantizationLevels - 1);

        for (unsigned int i = index; i < size; i += stride) {
            // Clamp value within minVal and maxVal
            const float clamped = fminf(fmaxf(x[i], minVal), maxVal);

            // Perform quantization with or without rounding
            y[i] = (truncate ? (int)((clamped - minVal) / scaling) : (int)roundf((clamped - minVal) / scaling))
                   * scaling + minVal;
        }
    }
    else {
        for (unsigned int i = index; i < size; i += stride) {
            // Assign binary values based on sign
            y[i] = (x[i] >= 0.0f) ? 1.0f : -1.0f;
        }
    }
}