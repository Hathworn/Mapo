#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void createRaysOrthoKernel(float4* rays, int width, int height, float x0, float y0, float z, float dx, float dy, unsigned rayMask )
{
    int rayx = blockIdx.x * blockDim.x + threadIdx.x;
    int rayy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if the current thread is within bounds
    if (rayx < width && rayy < height) {
        float tMinOrMask = rayMask ? __int_as_float(rayMask) : 0.0f;

        int idx = rayx + rayy * width;
        
        // Calculate ray origin and direction efficiently
        rays[2 * idx] = make_float4(x0 + rayx * dx, y0 + rayy * dy, z, tMinOrMask);
        rays[2 * idx + 1] = make_float4(0.0f, 0.0f, 1.0f, 1e34f);
    }
}