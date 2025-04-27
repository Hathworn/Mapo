#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void activate_array_leaky_kernel(float *x, int n)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within the array bounds
    if (index < n) {
        // Utilize inline conditional operator for potential speedup
        x[index] = (x[index] > 0) ? x[index] : x[index] * 0.1f;
    }
}