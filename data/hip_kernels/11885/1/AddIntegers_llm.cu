#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AddIntegers(int *arr1, int *arr2, int num_elements)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a loop to process more than one element per thread if necessary
    for (int i = id; i < num_elements; i += blockDim.x * gridDim.x)
    {
        arr1[i] += arr2[i];
    }
}