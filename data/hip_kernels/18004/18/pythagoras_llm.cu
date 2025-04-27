#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pythagoras(unsigned char* Gx, unsigned char* Gy, unsigned char* G, unsigned char* theta)
{
    int idx = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Use shared memory if needed (size calculation would depend on further context)
    // __shared__ float sharedGx[BlockSize];
    // __shared__ float sharedGy[BlockSize];

    // Load data from global to registers
    float af = float(Gx[idx]);
    float bf = float(Gy[idx]);

    // Compute sqrt and atan2 using registers for intermediate steps
    float magnitude = sqrtf(af * af + bf * bf);
    float angle = atan2f(af, bf) * 63.994f;

    // Store results back to global memory
    G[idx] = (unsigned char)magnitude;
    theta[idx] = (unsigned char)angle;
}