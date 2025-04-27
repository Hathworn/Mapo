#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AbsKernel_optimized(const float * A, int Acount, int Acols, float * out0, int out0count)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Loop through elements with stride for better occupancy
    for (int i = id; i < out0count; i += stride)
    {
        out0[i] = fabsf(A[i]);
    }
}