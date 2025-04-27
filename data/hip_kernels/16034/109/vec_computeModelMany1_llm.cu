#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel to perform bounds check and calculation efficiently
__global__ void vec_computeModelMany1 (int n, int sizeImage, double *result, double  *x, double  *amplitude,double background)
{
    // Calculate flattened unique thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x + 
             (blockIdx.y * blockDim.y + threadIdx.y) * gridDim.x * blockDim.x;

    // Check if id is within bounds
    if (id < n)
    {
        // Compute model using shared index
        result[id] = x[id] * amplitude[id / sizeImage] + background;
    }
}