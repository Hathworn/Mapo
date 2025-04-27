#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void huber(float *a, const size_t width, const size_t height, const float alpha, const float strength, const size_t pixelsPerThread, float *f)
{
    const size_t globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    const size_t col = globalIdx % width;
    const size_t crow = globalIdx / width * pixelsPerThread;
    
    // Return if out of bounds
    if (col >= width || crow >= height)
        return;

    const size_t erow = min(static_cast<unsigned int>(crow + pixelsPerThread), static_cast<unsigned int>(height));
    const float alpha2 = alpha * alpha;
    float colF = 0.0f;

    // Loop through rows assigned to this thread
    for (size_t row = crow; row < erow; ++row)
    {
        const size_t idx = row * width + col;
        
        // Optimized Pseudo-Huber loss function computation
        const float value = a[idx];
        const float root = sqrtf(1.0f + value * value / alpha2);
        const float increment = alpha2 * (root - 1.0f);
        
        colF += increment;
        a[idx] *= strength / root;
    }

    colF *= strength;
    
    // Store result back to global memory
    f[globalIdx] = colF;
}