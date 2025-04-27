#include "hip/hip_runtime.h"
#include "includes.h"
#define PI 3.141592653589793
#define BLOCKSIZE 1024

__global__ void cuMultiplyNum(float *dst, float num, int size)
{
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure within bounds, using warp-efficient conditional
    if (id < size) 
    {
        dst[id] *= num;
    }
}