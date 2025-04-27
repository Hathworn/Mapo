#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_sin_optimized(const float *A, int Acount, int Acols, float *out0, int out0count)
{
    // Compute id using a continuous, linear grid-stride loop for higher occupancy
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    for (int i = id; i < out0count; i += stride) {
        out0[i] = sin(A[i]);
    }
}