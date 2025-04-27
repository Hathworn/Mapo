#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_array_square(float* array, float* outArray, int size)
{
    // Calculate the global thread index
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use a simple stride loop to cover all elements efficiently
    for (int i = index; i < size; i += blockDim.x * gridDim.x)
    {
        outArray[i] = array[i] * array[i];
    }
}