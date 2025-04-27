#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void europeanOption(int size, int iterations, float *d_price, float initialPrice, float strikePrice, hiprandState_t *d_state)
{
    int tid = threadIdx.x + blockDim.x * blockIdx.x;

    if (tid < size)
    {
        float localPrice = initialPrice; // Move variable for thread-local computation

        // Use a local variable to avoid repeated calculations
        float mu_timespan_factor = mu / timespan;
        float sigma_sqrt_timespan = sigma / sqrt(timespan);

        for (int i = 0; i < iterations; i++)
        {
            localPrice *= 1 + mu_timespan_factor + hiprand_normal(&d_state[tid]) * sigma_sqrt_timespan;
        }

        // Use a single calculation and store only needed data
        d_price[tid] = fmaxf(localPrice - strikePrice, 0.0f);
    }
}