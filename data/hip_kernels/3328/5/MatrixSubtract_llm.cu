#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixSubtract(const float* A_elements, const float* B_elements, float* C_elements, const int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Unroll the loop for better performance and reduce thread divergence
    for(int i = idx; i < size; i += stride)
    {
        C_elements[i] = A_elements[i] - B_elements[i];
    }
}