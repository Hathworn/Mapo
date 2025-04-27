#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void apply_lifter_and_floor_energy(int num_frames, int num_cols, float cepstral_lifter, bool use_energy, float energy_floor, float *log_energy, float *lifter_coeffs, float *features, int32_t ldf) {
    int thread_id = threadIdx.x;
    int frame = blockIdx.x;

    float *feats = features + frame * ldf;

    // Apply lifter coefficients using shared memory for speed up
    if (cepstral_lifter != 0.0f) {
        __shared__ float shared_lifter_coeffs[CU1DBLOCK];
        int c = thread_id;
        while (c < num_cols) {
            if (thread_id < num_cols && c < CU1DBLOCK)
                shared_lifter_coeffs[thread_id] = lifter_coeffs[thread_id];
            __syncthreads();
            float lift = shared_lifter_coeffs[c % CU1DBLOCK];
            float f = feats[c];
            feats[c] = f * lift;
            c += CU1DBLOCK;
        }
    }

    // Thread 0 for each frame will apply energy
    if (use_energy && thread_id == 0) {
        float energy = log_energy[frame];
        float log_energy_floor = logf(energy_floor);
        
        if (energy_floor > 0.0f && energy < log_energy_floor) {
            energy = log_energy_floor;
        }
        feats[0] = energy;
    }
}