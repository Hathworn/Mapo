#include "hip/hip_runtime.h"
#include "includes.h"
#define PI 3.141592653589793
#define BLOCKSIZE 1024

__global__ void cuAdd(float *dst, const float * __restrict__ src, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < size) {
        dst[id] += src[id]; // Utilize memory coalescing for improved access efficiency
    }
}