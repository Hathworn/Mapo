#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void interStep_k(float* payoff, size_t scheduleCounter, float dx, float Smin, size_t P1, size_t P2, float barrier)
{
    size_t spot_idx = blockIdx.x;
    size_t state_idx = threadIdx.x;

    // Avoid shared memory use, calculate directly in registers.
    float temp = 0.0;
    size_t P1_k = P1 > scheduleCounter ? P1 - scheduleCounter : 0;
    float spot = Smin * expf(spot_idx * dx);

    // Reduce conditional complexity by restructuring logic.
    if (state_idx == P2)
    {
        temp = payoff[spot_idx + P2 * gridDim.x] * (spot >= barrier);
    }
    else if (state_idx >= P1_k && state_idx < P2)
    {
        temp = payoff[spot_idx + state_idx * gridDim.x] * (spot >= barrier)
             + payoff[spot_idx + (state_idx + 1) * gridDim.x] * (spot < barrier);
    }
    else if (state_idx == P1_k)
    {
        temp = payoff[spot_idx + P1_k * gridDim.x] * (spot < barrier);
    }

    // Synchronize writes at end only if necessary
    __syncthreads();
    payoff[spot_idx + state_idx * gridDim.x] = temp;
}