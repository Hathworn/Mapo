#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ARR_ADDC(float* result, float* in1, float* in2, int N)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for larger data
    for (int i = index; i < N; i += stride) // Use loop to cover entire data
    {
        result[i] = in1[i] + in2[i];
    }
}