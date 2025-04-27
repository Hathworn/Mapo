#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addOneFloat(double* vals, int N, float *out)
{
    // Flattened thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x 
            + blockIdx.y * blockDim.x * gridDim.x * blockDim.y + threadIdx.y * blockDim.x * gridDim.x 
            + threadIdx.z * blockDim.x * blockDim.y * gridDim.x;

    if(idx < N) {
        // Type cast double to float and add 1.0
        out[idx] = static_cast<float>(vals[idx]) + 1.0f;
    }
}