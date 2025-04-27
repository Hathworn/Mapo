#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDquantize_kernel(double* x, double* y, unsigned int size, double minVal, double maxVal, unsigned int quantizationLevels, bool truncate)
{
    // Calculate global thread index
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    // Calculate once outside the loop
    const double scaling = (quantizationLevels > 1) ? (maxVal - minVal) / (double)(quantizationLevels - 1) : 0.0;
    
    for (unsigned int i = index; i < size; i += stride) {
        double clamped = (quantizationLevels > 1) ? 
            (x[i] < minVal ? minVal : (x[i] > maxVal ? maxVal : x[i])) :
            x[i];
        
        if (quantizationLevels > 1) {
            // Choose truncation or rounding based on flag
            y[i] = truncate ? 
                ((int)((clamped - minVal) / scaling) * scaling + minVal) :
                ((int)round((clamped - minVal) / scaling) * scaling + minVal);
        } else {
            y[i] = ((x[i] >= 0.0) ? 1.0 : -1.0);
        }
    }
}
```
