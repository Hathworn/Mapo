#include "hip/hip_runtime.h"
#include "includes.h"
// Include files

// Parameters

#define N_ATOMS 343
#define MASS_ATOM 1.0f
#define time_step 0.01f
#define L 10.5f
#define T 0.728f
#define NUM_STEPS 10000

const int BLOCK_SIZE = 1024;
// const int L = ;
const int scheme = 1; // 0 for explicit, 1 for implicit

/*************************************************************************************************************/
/*************								INITIALIZATION CODE										**********/
/*************************************************************************************************************/

__device__ float PutInBox(float r) {
    if (fabs(r) > L / 2.0)
        r += (2 * (r < 0) - 1) * ceil((fabs(r) - L / 2.0f) / L) * L;
    return r;
}

__global__ void kinematics(float* positions, float* force, float* vel, int len) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within the limit
    if (index < len) {
        float mass_inv = 1.0f / MASS_ATOM;  // Pre-calculate inverse of mass
        float half_step_mass_inv = 0.5f * time_step * time_step * mass_inv;
        float vel_factor = time_step * mass_inv;

        // Calculate new position
        float new_pos = positions[index] + half_step_mass_inv * force[index] + vel[index] * time_step;
        positions[index] = PutInBox(new_pos);

        // Update velocity
        vel[index] += vel_factor * force[index];
    }
}