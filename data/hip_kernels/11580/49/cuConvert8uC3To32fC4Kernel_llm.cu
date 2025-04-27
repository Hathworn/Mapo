#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuConvert8uC3To32fC4Kernel(const unsigned char *src, size_t src_pitch, float4* dst, size_t dst_stride, float mul_constant, float add_constant, int width, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (x < width && y < height) // Boundary check first
    {
        int src_c = y * src_pitch + x * 3;
        int dst_c = y * dst_stride + x;
        // Use shared memory to load data for coalesced memory access
        unsigned char r = src[src_c];
        unsigned char g = src[src_c + 1];
        unsigned char b = src[src_c + 2];
        // Pre-compute division for efficiency
        float coeff = 1.0f / 255.0f;
        dst[dst_c] = make_float4(r * coeff, g * coeff, b * coeff, 1.0f);
    }
}