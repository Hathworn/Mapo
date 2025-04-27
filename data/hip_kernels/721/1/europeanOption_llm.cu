#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void europeanOption(int size, int iterations, float *d_price, float initialPrice, float strikePrice, hiprandState_t *d_state)
{
    // Calculate global thread index
    int tid = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Ensure thread is within bounds
    if (tid < size)
    {
        float localPrice = initialPrice; // Use local variable for initialPrice

        // Pre-calculate constants outside the loop
        float mu_coef = mu / timespan;
        float sigma_coef = sigma / sqrt(timespan);

        for (int i = 0; i < iterations; i++)
        {
            // Optimize arithmetic operations inside the loop
            localPrice *= 1 + mu_coef + hiprand_normal(&d_state[tid]) * sigma_coef;
        }

        // Calculate option price and ensure non-negative value
        d_price[tid] = fmaxf(localPrice - strikePrice, 0.0f);
    }
}