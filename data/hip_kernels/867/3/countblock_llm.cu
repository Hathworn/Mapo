#include "hip/hip_runtime.h"
#include "includes.h"
#define L2HYS_EPSILON       0.01f
#define L2HYS_EPSILONHYS    1.0f
#define L2HYS_CLIP          0.2f
#define data_h2y            30

__global__ void countblock(float *in, float *out)
{
    // Calculate indexes using 2D thread and block indices
    unsigned int idxBlock = 70 * blockIdx.x;
    unsigned int idxThreadIn = (blockIdx.y + threadIdx.x) * 10;
    unsigned int idxThreadOut = 120 * blockIdx.x + 30 * blockIdx.y + 10 * threadIdx.x;

    float *ptr_in = in + idxBlock + idxThreadIn;  // Input pointer calculation
    float *ptr_out = out + idxThreadOut;          // Output pointer calculation

    ptr_out[threadIdx.y] = ptr_in[threadIdx.y];    // Parallel writing using y-dimension threads
}