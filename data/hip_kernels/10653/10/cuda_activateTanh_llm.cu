#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuda_activateTanh(double* pA, int n)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Unrolled loop to increase parallelism
    for (int i = id; i < n; i += gridDim.x * blockDim.x) {
        pA[i] = tanh(pA[i]);
    }
}