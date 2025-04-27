#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDRectifier_backPropagate_kernel(double* x, double* dx, unsigned int size, double leakSlope, int shifting, double clipping)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Precompute shifting factors outside the loop to avoid redundant calculations
    const double shiftFactor = (shifting > 0) ? (1.0 / (1 << shifting)) : (1 << (-shifting));

    for (unsigned int i = index; i < size; i += stride) {
        dx[i] *= shiftFactor;  // Apply shifting factor

        // Use a single conditional statement for clarity and efficiency
        if (clipping > 0.0) {
            dx[i] *= (x[i] > clipping) ? 0.0 : ((x[i] > 0.0) ? 1.0 : leakSlope);
        }
        else {
            dx[i] *= (x[i] > 0.0) ? 1.0 : leakSlope;
        }
    }
}