#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Accumulate(float4 *src, float4 *dest, int loop) {
    // Calculate global thread index
    const size_t i = blockDim.x * blockIdx.x + threadIdx.x;
    const size_t k = blockDim.x * gridDim.x;

    // Initialize destination with the first source element
    float4 sum = src[i];

    // Unroll loop for better performance
    #pragma unroll
    for (int n = 1; n < loop; n++) {
        size_t index = i + n * k;
        sum.x += src[index].x;
        sum.y += src[index].y;
        sum.z += src[index].z;
        sum.w += src[index].w;
    }

    // Write the accumulated result
    dest[i] = sum;
}