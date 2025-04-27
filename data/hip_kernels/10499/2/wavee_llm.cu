#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void wavee(int* tab, unsigned int rowSize, unsigned int centerX, unsigned int centerY, float A, float lambda, float time, float fi, unsigned int N)
{
    // Calculate the global index.
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within the bounds.
    if (index < N) {
        // Calculate 2D grid coordinates.
        int w = index / rowSize;
        int h = index % rowSize;

        // Calculate dx and dy in a single expression.
        float dx = static_cast<float>(abs(centerX - w));
        float dy = static_cast<float>(abs(centerY - h));

        // Use built-in functions for distance computation.
        float distance = sqrtf(dx * dx + dy * dy);

        // Precompute constant values.
        const float pi = 3.1415f;
        const float v = 1.0f;
        const float T = lambda / v;
        const float ww = 2.0f * pi / T;
        const float k = 2.0f * pi / lambda;

        // Compute the wave equation.
        float f = A * sinf(ww * time - k * distance + fi);

        // Calculate the result and store it.
        float res = f * 127 + 127;
        tab[index] = static_cast<int>(res);
    }
}