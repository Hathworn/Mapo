#include "hip/hip_runtime.h"
#include "includes.h"

// Parameters

#define N_ATOMS 343
#define MASS_ATOM 1.0f
#define time_step 0.01f
#define L 10.5f
#define T 0.728f
#define NUM_STEPS 10000

const int BLOCK_SIZE = 1024;
const int scheme = 1; // 0 for explicit, 1 for implicit

__device__ float PutInBox(float r) {
    if (fabs(r) > L / 2.0)
        r += (2 * (r < 0) - 1) * ceil((fabs(r) - L / 2.0f) / L) * L;
    return r;
}

__global__ void kinematics_phase1(float* positions, float* force, float* vel, int len) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < len) {
        // Simplify calculation by reusing computed values
        float tempa = force[index] / MASS_ATOM;
        float tempvel = vel[index];
        float tempr = positions[index] + 0.5f * tempa * time_step * time_step + tempvel * time_step;
        
        // Ensure operations minimize redundant memory access
        positions[index] = PutInBox(tempr);
        vel[index] = tempvel + 0.5f * tempa * time_step;
    }
}