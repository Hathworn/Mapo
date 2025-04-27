#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pythagoras(unsigned char* Gx, unsigned char* Gy, unsigned char* G, unsigned char* theta)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global index

    // Use local variables for improved register use and readability
    float af = static_cast<float>(Gx[idx]);
    float bf = static_cast<float>(Gy[idx]);

    // Calculate gradient magnitude and orientation
    float magnitude = sqrtf(af * af + bf * bf);
    float angle = atan2f(af, bf) * 63.994f;

    // Store results
    G[idx] = static_cast<unsigned char>(magnitude); 
    theta[idx] = static_cast<unsigned char>(angle);
}