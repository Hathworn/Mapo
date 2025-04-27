#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Run_Me(int* The_Array, int size)
{
    // Use both blockIdx.x and threadIdx.x to parallelize the workload
    int ID = blockIdx.x * blockDim.x + threadIdx.x;
    if (ID < size) // Ensure ID is within bounds of the array
    {
        The_Array[ID] *= The_Array[ID]; // Optimize multiplication
    }
}