#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void tovalue_kernal(float* data, const float value, const int totaltc)
{
    // Calculate the global index using block and grid dimensions
    const uint idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if idx is within bounds and perform assignment
    if (idx < totaltc) {
        data[idx] = value;
    }
}