#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void apply_lifter_and_floor_energy( int num_frames, int num_cols, float cepstral_lifter, bool use_energy, float energy_floor, float *log_energy, float *lifter_coeffs, float *features, int32_t ldf) {
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    for (int frame = blockIdx.x; frame < num_frames; frame += gridDim.x) {
        float *feats = features + frame * ldf;

        // Apply lifter coefficients using shared memory
        if (cepstral_lifter != 0.0f) {
            for (int c = tid; c < num_cols; c += blockDim.x * gridDim.x) {
                float lift = lifter_coeffs[c];
                float f = feats[c];
                feats[c] = f * lift;
            }
        }

        // Use one thread per block to handle energy
        if (use_energy && threadIdx.x == 0) {
            float energy = log_energy[frame];
            float log_energy_floor = log(energy_floor);

            if (energy_floor > 0.0f && energy < log_energy_floor) {
                energy = log_energy_floor;
            }
            feats[0] = energy;
        }
    }
}