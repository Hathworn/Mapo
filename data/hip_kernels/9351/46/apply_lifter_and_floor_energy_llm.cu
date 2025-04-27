#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void apply_lifter_and_floor_energy(int num_frames, int num_cols, float cepstral_lifter, bool use_energy, float energy_floor, float *log_energy, float *lifter_coeffs, float *features, int32_t ldf) {
    int thread_id = threadIdx.x;
    int frame = blockIdx.x;
    
    float *feats = features + frame * ldf;
    
    // Apply lifter coefficients
    if (cepstral_lifter != 0.0f) {
        int index = thread_id;
        int stride = blockDim.x; // Use blockDim.x instead of CU1DBLOCK for portability
        while (index < num_cols) {
            float lift = lifter_coeffs[index];
            float f = feats[index];
            feats[index] = f * lift;
            index += stride;
        }
    }

    // Thread 0 for each frame will apply energy
    if (use_energy && thread_id == 0) {
        float energy = log_energy[frame];
        float log_energy_floor = log(energy_floor);

        // Apply energy flooring condition
        if (energy_floor > 0.0f && energy < log_energy_floor) {
            energy = log_energy_floor;
        }
        feats[0] = energy;
    }
}