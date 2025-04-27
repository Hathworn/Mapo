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
    // Cache common calculations to avoid redundant operations
    int bx = blockIdx.x;
    int tx = threadIdx.x;
    int row = tx + bx * BLOCK_SIZE;
    
    if (row < N * N)
    {
        float delx = PairWise[row];
        float dely = PairWise[row + N * N];
        float delz = PairWise[row + N * N * 2];
        float delr2 = delx * delx + dely * dely + delz * delz;

        if (delr2 == 0.0f) {
            PotOut[row] = 0.0f;
            ForceOut[row] = 0.0f;
            ForceOut[row + N * N] = 0.0f;
            ForceOut[row + N * N * 2] = 0.0f;
        } else {
            float delrm6 = __powf(delr2, -3.0f);
            float delrm12 = delrm6 * delrm6;
            float Pot = 4.0f * __fadd_rn(delrm12, -delrm6);
            float factor = 24.0f * __fadd_rn(2.0f * delrm12, -delrm6) / delr2;

            PotOut[row] = Pot;
            ForceOut[row] = -delx * factor;
            ForceOut[row + N * N] = -dely * factor;
            ForceOut[row + N * N * 2] = -delz * factor;
        }
    }
}