#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void apply_lifter_and_floor_energy(int num_frames, int num_cols, float cepstral_lifter, bool use_energy, float energy_floor, float *log_energy, float *lifter_coeffs, float *features, int32_t ldf) {
    int thread_id = threadIdx.x;
    int frame = blockIdx.x;

    float *feats = features + frame * ldf;

    // Apply lifter coefficients if cepstral_lifter is non-zero
    if (cepstral_lifter != 0.0f) {
        for (int c = thread_id; c < num_cols; c += blockDim.x) {
            feats[c] *= lifter_coeffs[c];  // Simplified lifting operation
        }
    }

    // Use energy only if conditions are met, thread 0 handles energy flooring
    if (use_energy && thread_id == 0) {
        float energy = log_energy[frame];
        if (energy_floor > 0.0f) {
            float log_energy_floor = log(energy_floor);
            if (energy < log_energy_floor) {
                energy = log_energy_floor;
            }
        }
        feats[0] = energy;
    }
}