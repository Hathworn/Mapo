#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDclamp_kernel(double* __restrict__ x, unsigned int size, double minVal, double maxVal)
{
    // Calculate index and stride for accessing elements
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Process elements using stride
    for (unsigned int i = index; i < size; i += stride) {
        // Clamp value within minVal and maxVal
        double val = x[i];
        x[i] = (val < minVal) ? minVal : (val > maxVal) ? maxVal : val;
    }
}