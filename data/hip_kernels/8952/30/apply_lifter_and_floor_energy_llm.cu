#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void apply_lifter_and_floor_energy(int num_frames, int num_cols, float cepstral_lifter, bool use_energy, float energy_floor, float *log_energy, float *lifter_coeffs, float *features, int32_t ldf) {
    int thread_id = threadIdx.x;
    int frame = blockIdx.x;

    float *feats = features + frame * ldf;

    // Apply lifter coefficients if necessary
    if (cepstral_lifter != 0.0f) {
        for (int c = thread_id; c < num_cols; c += blockDim.x) {
            feats[c] *= lifter_coeffs[c];
        }
    }

    // Use __syncthreads() to ensure lifter application is completed before energy floor is applied
    __syncthreads();

    // Only first thread in each block applies energy floor
    if (use_energy && thread_id == 0) {
        float energy = log_energy[frame];
        float log_energy_floor = logf(energy_floor);

        if (energy_floor > 0.0f && energy < log_energy_floor) {
            energy = log_energy_floor;
        }
        feats[0] = energy;
    }
}