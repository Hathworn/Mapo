#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize with shared memory and loop unrolling
__global__ void cosineSimilarityCuda(float3* pDotProducts, size_t pSize, float* results) {
    int instance = blockIdx.x * blockDim.x + threadIdx.x;

    __shared__ float3 sDotProducts[1024];
    sDotProducts[threadIdx.x] = pDotProducts[instance];
    __syncthreads();

    while (instance < pSize) {
        float3 dotProduct = sDotProducts[threadIdx.x];
        float sqrtX = sqrtf(dotProduct.x);
        float sqrtZ = sqrtf(dotProduct.z);
        results[instance] = dotProduct.y / (sqrtX * sqrtZ);
        instance += gridDim.x * blockDim.x;  // Ensure correct striding over grid dimensions
    }
}