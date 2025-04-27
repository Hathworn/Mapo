#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void apply_lifter_and_floor_energy( int num_frames, int num_cols, float cepstral_lifter, bool use_energy, float energy_floor, float *log_energy, float *lifter_coeffs, float *features, int32_t ldf) {
    int thread_id = threadIdx.x;
    int frame = blockIdx.x;

    float *feats = features + frame * ldf;

    // Use shared memory for lifter_coeffs for faster access
    extern __shared__ float shared_lifter_coeffs[];
    if (thread_id < num_cols) {
        shared_lifter_coeffs[thread_id] = lifter_coeffs[thread_id];
    }
    __syncthreads();

    // Apply lifter coefficients concurrently
    if (cepstral_lifter != 0.0f) {
        for (int c = thread_id; c < num_cols; c += blockDim.x) {
            float lift = shared_lifter_coeffs[c];
            feats[c] *= lift;
        }
    }

    // Use __syncthreads before accessing shared data
    __syncthreads();

    // Thread 0 for each frame will handle energy operations
    if (use_energy && thread_id == 0) {
        float energy = log_energy[frame];
        float log_energy_floor = logf(energy_floor);

        if (energy_floor > 0.0f && energy < log_energy_floor) {
            energy = log_energy_floor;
        }
        feats[0] = energy;
    }
}