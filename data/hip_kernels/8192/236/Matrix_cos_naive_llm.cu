#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Matrix_cos_naive(const float * A, int Acount, int Acols, float * out0, int out0count)
{
    // Calculate unique thread index
    int id = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * gridDim.x * blockDim.x;

    // Perform operation if id within bounds
    if (id < out0count) {
        out0[id] = cosf(A[id]); // Use fast math version of cosine
    }
}