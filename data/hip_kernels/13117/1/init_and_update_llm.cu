#include "hip/hip_runtime.h"
#include "includes.h"

#define MAXPOINTS 1000000
#define MAXSTEPS 1000000
#define MINPOINTS 20
#define PI 3.14159265

#define BLOCK_SIZE 512

void check_param(void);
void printfinal (void);

/**********************************************************************
*     Initialize points on line
*********************************************************************/

/**********************************************************************
*     Update all values along line a specified number of times
*********************************************************************/
__global__ void init_and_update (float *values_d, int tpoints, int nsteps){
    int idx = threadIdx.x + blockIdx.x * BLOCK_SIZE;
    
    // Ensure index is within the valid range
    if (idx < 1 || idx >= tpoints - 1)
        return;

    float old_v, v, new_v;

    // Calculate position and initial value using sin function
    float x = static_cast<float>(idx) / (tpoints - 1);
    v = sinf(2.0f * PI * x);
    old_v = v;

    // Calculate wave propagation through iterations
    for (int i = 0; i < nsteps; i++) {
        new_v = 2.0f * v - old_v + 0.09f * (-2.0f * v);
        old_v = v;
        v = new_v;
    }

    // Store the final computed value
    values_d[idx] = v;
}