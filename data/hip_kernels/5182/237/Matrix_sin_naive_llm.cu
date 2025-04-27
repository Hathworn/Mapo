#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Matrix_sin_naive(const float * A, int Acount, int Acols, float * out0, int out0count)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Ensure thread operates only within the bounds
    if (id < out0count) {
        // Use a more efficient math library function if available
        out0[id] = __sinf(A[id]);
    }
}