#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void apply_lifter_and_floor_energy(int num_frames, int num_cols, float cepstral_lifter, bool use_energy, float energy_floor, float *log_energy, float *lifter_coeffs, float *features, int32_t ldf) {
    int thread_id = threadIdx.x;
    int frame = blockIdx.x;
    float *feats = features + frame * ldf;

    // Apply lifter coefficients with coalesced memory access
    if (cepstral_lifter != 0.0f) {
        int num_threads = blockDim.x;
        for (int c = thread_id; c < num_cols; c += num_threads) {
            feats[c] *= lifter_coeffs[c];
        }
    }

    // Use shared memory to store log_energy_floor to minimize recomputation
    __shared__ float log_energy_floor_shared;
    
    if (thread_id == 0) {
        log_energy_floor_shared = log(energy_floor);
    }
    __syncthreads();

    // Thread 0 for each frame will apply energy efficiently
    if (use_energy && thread_id == 0) {
        float energy = log_energy[frame];
        if (energy_floor > 0.0f && energy < log_energy_floor_shared) {
            energy = log_energy_floor_shared;
        }
        feats[0] = energy;
    }
}