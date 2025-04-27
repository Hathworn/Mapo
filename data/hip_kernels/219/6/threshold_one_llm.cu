#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void threshold_one(float *vec, float *vec_thres, int *bin, const int k_bin, const int n)
{
    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use unsigned integer comparison instead of bitwise AND for bounds check
    if (xIndex < n && bin[xIndex] <= k_bin) 
    {
        vec_thres[xIndex] = vec[xIndex];
    }
}