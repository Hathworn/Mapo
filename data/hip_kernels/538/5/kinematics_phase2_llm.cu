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

__global__ void kinematics_phase2(float* force, float* vel, int len) {
  // Use thread-per-element pattern with bounds check
  int index = blockIdx.x * blockDim.x + threadIdx.x;
  if (index < len) {
    vel[index] += 0.5f * force[index] / MASS_ATOM * time_step; // Simplified computation for better performance
  }
}