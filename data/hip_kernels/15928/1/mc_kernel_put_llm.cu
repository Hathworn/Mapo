#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mc_kernel_put(float* d_s, float T, float K, float S0, float sigma, float mu, float r, float dt, float* d_normals, unsigned N_STEPS, unsigned N_PATHS)
{
    const unsigned tid = threadIdx.x;
    const unsigned bid = blockIdx.x;
    const unsigned bsz = blockDim.x;
    
    int s_idx = tid + bid * bsz;
    int n_idx = s_idx; // Use same index for simplicity
    float s_curr = S0;
    double payoff;

    if (s_idx < N_PATHS) {
        // Unroll the loop for better performance
        #pragma unroll
        for (int n = 0; n < N_STEPS; ++n) {
            s_curr += mu * s_curr * dt + sigma * s_curr * d_normals[n_idx];
            n_idx++;
        }
        payoff = (s_curr < K ? K - s_curr : 0.0);
        d_s[s_idx] = exp(-r * T) * payoff; // Move result computation outside if statement
    }
}