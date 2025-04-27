#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SetMatrixValueMinMaxY(float* matrix, int cols, int size, int id_min, int id_max, float value)
{
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;  // Calculate global thread ID
    if (id < size)
    {
        int id_row = id / cols;  // Compute the row index
        if (id_row >= id_min && id_row <= id_max)
        {
            matrix[id] = value;  // Set value only if within the specified row range
        }
    }
}