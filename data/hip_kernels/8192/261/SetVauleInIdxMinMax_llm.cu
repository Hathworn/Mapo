#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SetVauleInIdxMinMax(float* vector, int id_min, int id_max, float value)
{
    // Calculate the global thread index more efficiently
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Use an efficient check to ensure the index is within bounds
    if (id_min <= id && id <= id_max) {
        vector[id] = value;
    }
}