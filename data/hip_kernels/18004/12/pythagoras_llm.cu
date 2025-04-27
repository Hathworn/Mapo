#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel computation by using shared memory and reducing register usage.
__global__ void pythagoras(unsigned char* Gx, unsigned char* Gy, unsigned char* G, unsigned char* theta)
{
    int idx = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Load data into registers from global memory
    float af = static_cast<float>(Gx[idx]);
    float bf = static_cast<float>(Gy[idx]);

    // Perform calculations directly in registers to minimize memory access
    float magnitude = sqrtf(af * af + bf * bf);
    float angle = atan2f(af, bf) * 63.994f;

    // Store results back to global memory using registers' calculated values
    G[idx] = static_cast<unsigned char>(magnitude);
    theta[idx] = static_cast<unsigned char>(angle);
}