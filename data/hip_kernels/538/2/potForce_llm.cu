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

__global__ void potForce(float * PairWise, int N, float * PotOut, float * ForceOut)
{
    int row = threadIdx.x + blockIdx.x * blockDim.x;

    // Return early if out of bounds
    if (row >= N * N) return;

    // Load data into registers to minimize global memory access
    float delx = PairWise[row];
    float dely = PairWise[row + N * N];
    float delz = PairWise[row + 2 * N * N];

    float delr2 = delx * delx + dely * dely + delz * delz;
    // Avoid division/zero errors
    if (delr2 == 0.0f) {
        PotOut[row] = 0.0f;
        ForceOut[row] = 0.0f;
        ForceOut[row + N * N] = 0.0f;
        ForceOut[row + 2 * N * N] = 0.0f;
        return;
    }

    float delrm6 = rsqrtf(delr2 * delr2 * delr2);
    float delrm12 = delrm6 * delrm6;
    float potential_val = 4 * (delrm12 - delrm6);
    PotOut[row] = potential_val;

    // Pre-compute common factor for forces
    float force_factor = -24 * (2 * delrm12 - delrm6) / delr2;
    
    ForceOut[row] = delx * force_factor;
    ForceOut[row + N * N] = dely * force_factor;
    ForceOut[row + 2 * N * N] = delz * force_factor;
}