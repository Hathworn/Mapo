#include "hip/hip_runtime.h"
#include "includes.h"

// Define constants for initialization values to avoid magic numbers
#define INITIAL_POS_X 2.0f
#define INITIAL_POS_Y 0.0f
#define INITIAL_POS_Z 0.0f
#define INITIAL_VEL 0.0f
#define INITIAL_AGE -1.0f
#define INITIAL_LIFE -1.0f
#define INITIAL_OPAFIX 0

__global__ void resetParticlesKernel(float3* pos, float3* vel, float* age, float* life, char* opafix, int nParts)
{
    unsigned int n = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check boundary condition
    if (n < nParts) {
        // Initialize positions, velocities, age, life and opafix
        pos[n] = make_float3(INITIAL_POS_X, INITIAL_POS_Y, INITIAL_POS_Z);
        vel[n] = make_float3(INITIAL_VEL, INITIAL_VEL, INITIAL_VEL);
        age[n] = INITIAL_AGE;
        life[n] = INITIAL_LIFE;
        opafix[n] = INITIAL_OPAFIX;
    }
}