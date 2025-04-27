#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_addPhotonsAndBackgroundMany_scmos (int n, int sizeSubImage, double *output, double *input, double *photonAndBackground, double *scmos)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;
    int id = idy * gridDim.x * blockDim.x + idx;
    
    // Ensure index is within bounds
    if (id < n) 
    {
        int id2 = id / sizeSubImage;
        double photonBg1 = photonAndBackground[id2 * 2];       // Cache value to reduce global memory access
        double photonBg2 = photonAndBackground[id2 * 2 + 1];   // Cache value to reduce global memory access
        output[id] = input[id] * photonBg1 + photonBg2 + scmos[id];
    }
}