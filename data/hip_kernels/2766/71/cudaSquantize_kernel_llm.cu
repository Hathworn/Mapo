#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSquantize_kernel(float* x, float* y, unsigned int size, float minVal, float maxVal, unsigned int quantizationLevels, bool truncate)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    if (quantizationLevels > 1) {
        const float scaling = (maxVal - minVal) / (float)(quantizationLevels - 1);

        // Unrolling the loop for better performance
        for (unsigned int i = index; i < size; i += stride*4) {
            float clamped, value;

            #pragma unroll
            for (int j = 0; j < 4; ++j) {
                unsigned int idx = i + j * stride;
                if (idx < size) {
                    clamped = fminf(fmaxf(x[idx], minVal), maxVal);
                    if (truncate)
                        value = (int)((clamped - minVal) / scaling) * scaling + minVal;
                    else
                        value = (int)roundf((clamped - minVal) / scaling) * scaling + minVal;

                    y[idx] = value;
                }
            }
        }
    }
    else {
        // Unrolling the loop for better performance
        for (unsigned int i = index; i < size; i += stride*4) {
            #pragma unroll
            for (int j = 0; j < 4; ++j) {
                unsigned int idx = i + j * stride;
                if (idx < size) {
                    y[idx] = ((x[idx] >= 0.0f) ? 1.0f : -1.0f);
                }
            }
        }
    }
}