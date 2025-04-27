#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *__restrict__ pred, float *__restrict__ truth, float *__restrict__ delta, float *__restrict__ error)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x; 

    // Ensure the thread is within bounds
    if (i < n) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff);

        // Use conditional operator to simplify branching
        error[i] = (abs_val < 1) ? diff * diff : 2 * abs_val - 1;
        delta[i] = (abs_val < 1) ? diff : (diff > 0 ? 1 : -1);
    }
}