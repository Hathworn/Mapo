#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void apply_lifter_and_floor_energy(int num_frames, int num_cols, float cepstral_lifter, bool use_energy, float energy_floor, float *log_energy, float *lifter_coeffs, float *features, int32_t ldf) {
    int thread_id = threadIdx.x;
    int frame = blockIdx.x;

    float *feats = features + frame * ldf;

    // Apply lifter coefficients in parallel
    if (cepstral_lifter != 0.0f) {
        for (int c = thread_id; c < num_cols; c += blockDim.x) {  // Use blockDim.x for better readability
            feats[c] *= lifter_coeffs[c];  // Update feature in-place
        }
    }

    // Use __syncthreads to ensure all threads have completed lifter application
    __syncthreads();

    if (use_energy && thread_id == 0) {
        float energy = log_energy[frame];
        if (energy_floor > 0.0f && energy < log(energy_floor)) {
            energy = log(energy_floor);
        }
        feats[0] = energy;  // Apply energy at the start of the feature
    }
}