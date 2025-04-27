#include "hip/hip_runtime.h"
#include "includes.h"
#define PI 3.141592653589793
#define BLOCKSIZE 1024

__global__ void cuMultiplyNum(float *dst, float num, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread id is within bounds and perform multiplication.
    if (id < size) {
        dst[id] *= num;
    }
}