#include "hip/hip_runtime.h"
#include "includes.h"
#define CU1DBLOCK 256

__global__ void apply_lifter_and_floor_energy(int num_frames, int num_cols, float cepstral_lifter, bool use_energy, float energy_floor, float *log_energy, float *lifter_coeffs, float *features, int32_t ldf) {
    int thread_id = threadIdx.x;
    int frame = blockIdx.x;

    __shared__ float shared_energy; // Shared memory for energy

    float *feats = features + frame * ldf;

    // Apply lifter coefficients using shared memory for improved memory access
    if (cepstral_lifter != 0.0f) {
        for (int c = thread_id; c < num_cols; c += CU1DBLOCK) {
            if (c < num_cols) {
                float lift = lifter_coeffs[c];
                float f = feats[c];
                feats[c] = f * lift;
            }
        }
    }

    // Use energy; Thread 0 for each frame will apply energy
    if (use_energy && thread_id == 0) {
        float energy = log_energy[frame];
        float log_energy_floor = log(energy_floor);

        if (energy_floor > 0.0f && energy < log_energy_floor) {
            energy = log_energy_floor;
        }
        shared_energy = energy;
    }

    __syncthreads(); // Synchronize to ensure shared memory is updated

    if (use_energy && thread_id == 0) {
        feats[0] = shared_energy; // Sets the energy for the first feature
    }
}