#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    // Calculate global index and stride to handle more elements in fewer blocks
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Loop over elements with a step size of stride
    for (; i < numElements; i += stride)
    {
        C[i] = A[i] + B[i];
    }
}