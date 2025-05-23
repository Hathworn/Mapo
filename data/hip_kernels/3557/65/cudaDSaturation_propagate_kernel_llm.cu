#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDSaturation_propagate_kernel(double* x, double* y, unsigned int size, double threshold)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Avoid redundant threshold check inside the loop
    if (threshold != 0.0) {
        for (unsigned int i = index; i < size; i += stride) {
            double value = x[i];
            // Use min and max for cleaner clamping logic
            y[i] = max(-threshold, min(value, threshold));
        }
    }
}