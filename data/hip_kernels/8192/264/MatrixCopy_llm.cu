#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MatrixCopy(float* in, float *out, int size)
{
    // Improved linear thread indexing
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a strided loop for potential better occupancy
    for (int i = id; i < size; i += blockDim.x * gridDim.x) {
        out[i] = in[i];
    }
}