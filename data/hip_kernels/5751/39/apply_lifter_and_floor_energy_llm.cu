#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void apply_lifter_and_floor_energy(int num_frames, int num_cols, float cepstral_lifter, bool use_energy, float energy_floor, float *log_energy, float *lifter_coeffs, float *features, int32_t ldf) {
    int thread_id = threadIdx.x;
    int frame = blockIdx.x;

    float *feats = features + frame * ldf;

    // Apply lifter coefficients with optimized memory coalescing
    if (cepstral_lifter != 0.0f) {
        for (int c = thread_id; c < num_cols; c += blockDim.x) { // Use blockDim.x instead of CU1DBLOCK
            float lift = lifter_coeffs[c];
            atomicExch(&feats[c], feats[c] * lift); // Apply atomic operation for synchronization
        }
    }

    // Thread 0 for each frame will apply energy
    if (use_energy && thread_id == 0) {
        float energy = log_energy[frame];
        float log_energy_floor = logf(energy_floor); // Use logf for single precision

        if (energy_floor > 0.0f && energy < log_energy_floor) {
            energy = log_energy_floor;
        }
        atomicExch(&feats[0], energy); // Use atomic operation to avoid race conditions
    }
}