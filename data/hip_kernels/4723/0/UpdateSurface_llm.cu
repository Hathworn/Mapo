#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UpdateSurface(hipSurfaceObject_t surf, unsigned int width, unsigned int height, float time)
{
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (y >= height || x >= width) return;  // Correct condition operator to logical OR

    // Precompute commonly used values outside of branches
    float cosTime = __cosf(time) * 0.5f;
    float xVar = static_cast<float>(x) / static_cast<float>(width);
    float yVar = static_cast<float>(y) / static_cast<float>(height);
    float costx = cosTime + xVar;
    float costyMany = __cosf(static_cast<float>(x) / 100.0f * time) * 0.5f + xVar;
    
    float4 pixel;

    // Use flattening to reduce if-else depth for performance
    if (y == 0) {
        pixel = make_float4(costyMany * 0.3f, costyMany, costyMany * 0.4f, 1.0f);
    } else if (y == height - 1) {
        pixel = make_float4(costyMany * 0.6f, costyMany * 0.7f, costyMany, 1.0f);
    } else if (x % 2 == 0) {
        pixel = (x > width / 2) ?
                  make_float4(0.1f, 0.5f, costx, 1.0f) :
                  make_float4(costx, 0.1f, 0.2f, 1.0f);
    } else if (x > width - 2 || x <= 1) {
        float costxMany = __cosf(y * time) * 0.5f + yVar;
        pixel = make_float4(costxMany, costxMany * 0.9f, costxMany * 0.6f, 1.0f);
    } else {
        pixel = make_float4(costx * 0.3f, costx * 0.4f, costx * 0.6f, 1.0f);
    }

    surf2Dwrite(pixel, surf, x * sizeof(float4), y);  // Ensure the correct size to prevent misalignment
}