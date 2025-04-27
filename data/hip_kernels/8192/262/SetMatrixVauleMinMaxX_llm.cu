#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SetMatrixVauleMinMaxX(float* matrix, int cols, int size, int id_min, int id_max, float value)
{
    // Calculate unique thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    // Process valid elements more efficiently
    if (id < size) {
        int id_column = id % cols;
        if (id_column >= id_min && id_column <= id_max) {
            matrix[id] = value;
        }
    }
}