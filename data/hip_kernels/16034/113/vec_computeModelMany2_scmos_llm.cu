#include "hip/hip_runtime.h"
#include "includes.h"


//WARNING : device_sum size should be gridDim.x
__global__ void vec_computeModelMany2_scmos (int n, int sizeImage, double *result, double  *x, double  *amplitude, double *background, double  *scmos)
{
    // Calculate global thread index
    int id = blockIdx.y * gridDim.x * blockDim.x * blockDim.y + blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    
    // Ensure thread is within bounds
    if (id < n)
    {
        // Optimize index calculations
        int id2 = id / sizeImage;
        int id3 = id % sizeImage;
        
        // Compute the model
        result[id] = x[id] * amplitude[id2] + background[id2] + scmos[id3];
    }
}