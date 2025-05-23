#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSRectifier_backPropagate_kernel(float* x, float* dx, unsigned int size, float leakSlope, int shifting, float clipping)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Optimize division/multiplication by powers of two using bitwise shift
    const float shiftMultiplier = (shifting > 0) 
                                  ? 1.0f / (1 << shifting) 
                                  : (shifting < 0) 
                                  ? 1 << (-shifting) 
                                  : 1.0f;

    for (unsigned int i = index; i < size; i += stride) {
        dx[i] *= shiftMultiplier;

        // Simplify conditions using compound assignment
        if (clipping > 0.0f) {
            dx[i] *= (x[i] > clipping) ? 0.0f : (x[i] > 0.0f) ? 1.0f : leakSlope;
        }
        else {
            dx[i] *= (x[i] > 0.0f) ? 1.0f : leakSlope;
        }
    }
}