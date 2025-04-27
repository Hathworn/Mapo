#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pi_estimation(float *pi, hiprandState *states)
{
    unsigned int threadID = threadIdx.x + blockDim.x * blockIdx.x;
    int count = 0;
    float x, y, z;

    // Initialize random state outside the loop
    hiprand_init(0, threadID, 0, &states[threadID]);

    // Use registers to store frequently used values
    hiprandState localState = states[threadID];

    for (int i = 0; i < trial_number; i++)
    {
        x = hiprand_uniform(&localState); // Obtaining random x
        y = hiprand_uniform(&localState); // Obtaining random y
        z = (x * x + y * y); // Calculate z
        if (z <= 1.0f) // Check if point is in the unit circle
        {
            count += 1;
        }
    }

    states[threadID] = localState; // Save modified state back to global memory
    pi[threadID] = 4.0f * count / (float)trial_number; // Estimate PI
}