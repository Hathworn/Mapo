#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDquantize_kernel(double* x, double* y, unsigned int size, double minVal, double maxVal, unsigned int quantizationLevels, bool truncate)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    if (quantizationLevels > 1) {
        const double scaling = (maxVal - minVal) / (double)(quantizationLevels - 1);

        // Optimize by reducing redundant condition checks
        for (unsigned int i = index; i < size; i += stride) {
            double clamped = x[i];
            if (clamped < minVal) clamped = minVal;
            else if (clamped > maxVal) clamped = maxVal;

            double quantizedValue = (clamped - minVal) / scaling;
            if (truncate)
                quantizedValue = (int)quantizedValue;
            else
                quantizedValue = (int)round(quantizedValue);

            y[i] = quantizedValue * scaling + minVal;
        }
    } else {
        for (unsigned int i = index; i < size; i += stride)
            y[i] = ((x[i] >= 0.0) ? 1.0 : -1.0);
    }
}