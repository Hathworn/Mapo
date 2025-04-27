#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_computeModelMany3(int n, int sizeImage, double *result, double *x, double *amplitude, double *background)
{
    // Optimize indexing calculation for better performance
    int id = blockIdx.y * gridDim.x * blockDim.x * blockDim.y + blockIdx.x * blockDim.x * blockDim.y 
             + threadIdx.y * blockDim.x + threadIdx.x;
    if (id < n)
    {
        int id2 = id / sizeImage;
        int id3 = id % sizeImage;
        
        // Perform computation
        result[id] = x[id] * amplitude[id2] + background[id3];
    }
}