#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initPayoff_k(float* payoff, float dx, float Smin, float strike, size_t P1, size_t P2) {
    size_t spot_idx = threadIdx.x;
    size_t state_idx = blockIdx.x;

    // Prefetch dx exponentiation and index computation outside the conditional
    float spot = Smin * expf(spot_idx * dx);
    size_t idx = spot_idx + state_idx * blockDim.x;

    // Use conditional expression without multiplication to simplify
    if (state_idx <= P2 && state_idx >= P1) {
        payoff[idx] = fmaxf(0.0f, spot - strike);
    } else {
        payoff[idx] = 0.0f; // Avoid uninitialized assignments
    }
}