#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelUpdateParticle(double *positions, double *velocities, double *pBests, double *gBest, int particlesCount, int dimensionsCount, double r1, double r2)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx < particlesCount * dimensionsCount) {
        // Calculate linear index
        int particle = idx / dimensionsCount;
        int dimension = idx % dimensionsCount;

        // Compute velocity for current dimension
        double currentPos = positions[idx];
        double personalBest = pBests[idx];
        double globalBest = gBest[dimension];

        velocities[idx] = d_OMEGA * velocities[idx] + r1 * (personalBest - currentPos)
                        + r2 * (globalBest - currentPos);

        // Update particle position
        positions[idx] += velocities[idx];
    }
}