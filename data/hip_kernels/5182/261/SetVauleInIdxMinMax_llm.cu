#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SetVauleInIdxMinMax(float* vector, int id_min, int id_max, float value)
{
    // Calculate the global thread index more efficiently
    int id = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x;
    
    // Use branchless approach for setting value
    if (id >= id_min && id <= id_max) {
        vector[id] = value;
    }
}