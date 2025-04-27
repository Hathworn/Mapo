#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function with loop unrolling and early exit condition
__global__ void cudaDSaturation_propagate_kernel(double* x, double* y, unsigned int size, int shifting, double threshold)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    if(index >= size) return; // Early exit if index is out of bounds

    double factor = (shifting > 0) ? (1.0 / (1 << shifting)) : (1 << (-shifting));
    double th = fabs(threshold); // Use absolute value for consistency

    for (unsigned int i = index; i < size; i += stride) {
        double value = x[i] * factor; // Apply shifting once
        
        // Apply saturation with ternary operators
        y[i] = (th != 0.0) ? ((value < -th) ? -th : ((value > th) ? th : value)) : value;
    }
}