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
const int scheme = 1; // 0 for explicit, 1 for implicit

/*************************************************************************************************************/
/*************								INITIALIZATION CODE										**********/
/*************************************************************************************************************/

__global__ void forcered_simple(float * force, float * forcered){
    int index = threadIdx.x + blockDim.x * blockIdx.x;
    __shared__ float forcered_sh[3 * N_ATOMS];

    // Initialize shared memory with zero if within bounds.
    if (index < 3 * N_ATOMS) {
        forcered_sh[index] = 0.0f;
    }
    __syncthreads();

    // Calculate reduced force sums using atomic operations for thread safety.
    if (index < 3 * N_ATOMS) {
        int findex = (index / N_ATOMS) * N_ATOMS * N_ATOMS + (index % N_ATOMS);
        float sum = 0.0f;
        for (int i = 0; i < N_ATOMS; i++) {
            sum += force[findex + i * N_ATOMS];
        }
        atomicAdd(&forcered_sh[index], sum);
    }
    __syncthreads();

    // Write the results from shared to global memory if within bounds.
    if (index < 3 * N_ATOMS) {
        forcered[index] = forcered_sh[index];
    }
}