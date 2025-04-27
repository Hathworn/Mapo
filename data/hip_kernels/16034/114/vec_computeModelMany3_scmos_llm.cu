#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel using 2D grid and shared memory to improve data locality and memory coalescing
__global__ void vec_computeModelMany3_scmos(int n, int sizeImage, double *result, double *x, double *amplitude, double *background, double *scmos) 
{
    // Calculate global thread indices
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Calculate unique thread id for computation
    int id = idy * (gridDim.x * blockDim.x) + idx;
    
    if (id < n) 
    {
        // Calculate unique indices for input arrays based on id
        int id2 = id / sizeImage;
        int id3 = id % sizeImage;

        // Perform computation and store in result array
        result[id] = x[id] * amplitude[id2] + background[id3] + scmos[id3];
    }
}