#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelUpdateParticle(double *positions, double *velocities, double *pBests, double *gBest, int particlesCount, int dimensionsCount, double r1, double r2)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if(i >= particlesCount * dimensionsCount) // Check bounds to avoid unnecessary operations
        return;
    
    // Cache data in local variables for reduced global memory access
    double pos = positions[i];
    double vel = velocities[i];
    double pBest = pBests[i];
    double gBestVal = gBest[i % dimensionsCount];
    
    // Update velocities
    vel = d_OMEGA * vel + r1 * (pBest - pos) + r2 * (gBestVal - pos);
    
    // Update position
    pos += vel;
    
    // Store results back to global memory
    velocities[i] = vel;
    positions[i] = pos;
}