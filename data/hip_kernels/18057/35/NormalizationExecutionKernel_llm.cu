#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizationExecutionKernel(unsigned char* src, float* dst, const int size, const float alpha, const float beta, const float bias)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll the loop to handle more elements per thread where applicable
    int stride = blockDim.x * gridDim.x;
    for(; index < size; index += stride) {
        dst[index] = (static_cast<float>(src[index]) - alpha) / beta + bias; // Use static_cast for better type conversion
    }
}