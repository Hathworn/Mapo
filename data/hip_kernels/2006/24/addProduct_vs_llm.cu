#include "hip/hip_runtime.h"
#include "includes.h"

/*
* Perform a reduction from data of length 'size' to result, where length of result will be 'number of blocks'.
*/
extern "C"
__global__ void addProduct_vs(int n, float *a, float *b, float c, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    int gridSize = blockDim.x * gridDim.x;          // Calculate total number of threads in grid

    // Loop through all elements, processing those assigned to current thread index
    while (i < n) {
        result[i] = a[i] + b[i] * c;
        i += gridSize;                              // Move to next element in grid stride
    }
}