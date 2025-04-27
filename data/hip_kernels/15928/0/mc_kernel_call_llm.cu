#include "hip/hip_runtime.h"
#include "includes.h"

// wrapper for a call option
__global__ void mc_kernel_call(float * d_s, float T, float K, float S0, float sigma, float mu, float r, float dt, float * d_normals, unsigned N_STEPS, unsigned N_PATHS)
{
    // Cache thread and block information
    const unsigned tid = threadIdx.x;
    const unsigned bid = blockIdx.x;
    const unsigned bsz = blockDim.x;

    // Compute global index
    int global_idx = tid + bid * bsz;
    
    // Early return if index is out of bounds
    if (global_idx >= N_PATHS) return;

    // Initialize variables
    float s_curr = S0;
    int n_idx = global_idx;

    // Simulation loop
    for (unsigned n = 0; n < N_STEPS; ++n) {
        s_curr += mu * s_curr * dt + sigma * s_curr * d_normals[n_idx];
        n_idx += bsz * gridDim.x; // Advance to the next step's normal value
    }

    // Calculate payoff
    float payoff = (s_curr > K) ? (s_curr - K) : 0.0f;
    
    // Store the discounted payoff
    d_s[global_idx] = expf(-r * T) * payoff;
}