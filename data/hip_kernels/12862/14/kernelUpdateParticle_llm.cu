#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelUpdateParticle(double *positions, double *velocities, double *pBests, double *gBest, int particlesCount, int dimensionsCount, double r1, double r2)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Reduce the number of checks by using a smaller index range
    if (i < particlesCount * dimensionsCount) {
        // Use temporary variables to minimize memory access
        double position = positions[i];
        double velocity = velocities[i];
        double pBest = pBests[i];
        double gBestValue = gBest[i % dimensionsCount];

        // Compute new velocity based on update rule
        velocity = d_OMEGA * velocity + r1 * (pBest - position)
                                    + r2 * (gBestValue - position);

        // Update particle position
        positions[i] = position + velocity;
        velocities[i] = velocity;
    }
}