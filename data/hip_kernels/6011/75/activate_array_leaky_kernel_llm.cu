#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void activate_array_leaky_kernel(float *x, int n)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < n) {
        // Use register memory for improved performance
        float val = x[index];
        x[index] = (val > 0) ? val : val * 0.1f; // Replace division for better optimization
    }
}