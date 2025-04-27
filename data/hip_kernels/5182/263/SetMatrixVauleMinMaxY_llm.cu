#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SetMatrixValueMinMaxY(float* matrix, int cols, int size, int id_min, int id_max, float value)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Get the row index from the thread ID
    int id_row = id / cols;
    
    // Check boundaries and update matrix values
    if (id < size && id_row >= id_min && id_row <= id_max)
    {
        matrix[id] = value;
    }
}