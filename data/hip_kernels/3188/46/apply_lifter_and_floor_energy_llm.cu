#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void apply_lifter_and_floor_energy( int num_frames, int num_cols, float cepstral_lifter, bool use_energy, float energy_floor, float *log_energy, float *lifter_coeffs, float *features, int32_t ldf) {
    int thread_id = threadIdx.x;
    int frame = blockIdx.x;

    float *feats = features + frame * ldf;

    // Apply lifter coefficients with better parallel efficiency
    if (cepstral_lifter != 0.0f) {
        for (int c = thread_id; c < num_cols; c += blockDim.x) { // Use blockDim.x instead of CU1DBLOCK
            feats[c] *= lifter_coeffs[c]; // Inline lift and multiplication
        }
    }

    // Use thread 0 to apply energy only if needed
    if (use_energy && thread_id == 0) {
        float energy = log_energy[frame];
        float log_energy_floor = logf(energy_floor); // Use logf for float

        if (energy_floor > 0.0f && energy < log_energy_floor) {
            energy = log_energy_floor;
        }
        feats[0] = energy;
    }
}