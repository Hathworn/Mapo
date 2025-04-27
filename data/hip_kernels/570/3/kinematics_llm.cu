```c
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

/*************************************************************************************************************/
/*************								INITIALIZATION CODE										**********/
/*************************************************************************************************************/

__device__ float PutInBox(float r) {
    // Use modulo operation to keep r within box limits
    float halfL = L / 2.0f;
    if (fabs(r) > halfL) {
        float lCeil = ceil((fabs(r) - halfL) / L);
        r += (2 * (r < 0) - 1) * lCeil * L;
    }
    return r;
}

__global__ void kinematics(float* positions, float* force, float* vel, int len) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Check index within bounds in advance for better warp efficiency
    if (index < len) {
        float force_term = force[index] / MASS_ATOM * time_step;
        // Optimize by avoiding recomputation of time_step*time_step
        float time_step_sq_half = 0.5f * time_step * time_step;
        float tempr = positions[index] + force_term * time_step_sq_half + vel[index] * time_step;
        positions[index] = PutInBox(tempr);
        vel[index] += force_term;
    }
}