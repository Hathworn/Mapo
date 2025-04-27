#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void apply_lifter_and_floor_energy(int num_frames, int num_cols, float cepstral_lifter, bool use_energy, float energy_floor, float* log_energy, float* lifter_coeffs, float* features, int32_t ldf) {
    int thread_id = threadIdx.x;
    int frame = blockIdx.x;

    float* feats = features + frame * ldf;

    // Apply lifter coefficients with improved memory coalescing
    if (cepstral_lifter != 0.0f) {
        for (int c = thread_id; c < num_cols; c += blockDim.x) {
            feats[c] *= lifter_coeffs[c];
        }
    }

    // Use shared memory to possibly optimize energy access (hypothetical, usage depends on size and use case)
    __shared__ float shared_log_energy;
    
    // Apply energy in thread 0 for the frame only if needed
    if (use_energy && thread_id == 0) {
        float energy = log_energy[frame];
        float log_energy_floor = logf(energy_floor);  // Using logf for float computation

        if (energy_floor > 0.0f && energy < log_energy_floor) {
            energy = log_energy_floor;
        }
        
        shared_log_energy = energy;
        feats[0] = shared_log_energy;
    }
}