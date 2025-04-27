#include "hip/hip_runtime.h"
#include "includes.h"

#define MINVAL 1e-7

__global__ void Permute(double* Dev_Mtr, int* i, int* k, int* Dev_size)
{
    int index = blockDim.x * blockIdx.x + threadIdx.x;

    if (index < *Dev_size)
    {
        // Calculating the base index only once to save redundant calculations
        int baseIndex = index * (*Dev_size);
        double tmp = Dev_Mtr[baseIndex + (*i)];
        Dev_Mtr[baseIndex + (*i)] = Dev_Mtr[baseIndex + (*k)];
        Dev_Mtr[baseIndex + (*k)] = tmp;
    }
}