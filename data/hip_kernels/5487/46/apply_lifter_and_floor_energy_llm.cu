#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void apply_lifter_and_floor_energy(int num_frames, int num_cols, float cepstral_lifter, bool use_energy, float energy_floor, float *log_energy, float *lifter_coeffs, float *features, int32_t ldf) {
    // Calculate global thread index
    int global_thread_id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Apply lifter coefficients using all threads
    if (cepstral_lifter != 0.0f) {
        if (global_thread_id < num_frames * num_cols) {
            int frame = global_thread_id / num_cols;
            int c = global_thread_id % num_cols;
            float *feats = features + frame * ldf;
            feats[c] *= lifter_coeffs[c];
        }
    }
    
    // Use first thread to apply energy per frame
    if (use_energy && threadIdx.x == 0) {
        float energy = log_energy[blockIdx.x];
        float log_energy_floor = log(energy_floor);
        
        if (energy_floor > 0.0f && energy < log_energy_floor) {
            energy = log_energy_floor;
        }
        features[blockIdx.x * ldf] = energy;
    }
}