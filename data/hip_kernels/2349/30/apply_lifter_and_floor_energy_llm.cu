#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void apply_lifter_and_floor_energy(int num_frames, int num_cols, float cepstral_lifter, bool use_energy, float energy_floor, float *log_energy, float *lifter_coeffs, float *features, int32_t ldf) {
    int thread_id = threadIdx.x;
    int frame = blockIdx.x;

    float *feats = features + frame * ldf;

    // Apply lifter coefficients using shared memory for coefficients
    __shared__ float shared_lifter_coeffs[1024];  // Assuming max num_cols <= 1024
    if (thread_id < num_cols) {
        shared_lifter_coeffs[thread_id] = lifter_coeffs[thread_id];
    }
    __syncthreads();

    if (cepstral_lifter != 0.0f) {
        for (int c = thread_id; c < num_cols; c += blockDim.x) {
            float lift = shared_lifter_coeffs[c];
            float f = feats[c];
            feats[c] = f * lift;
        }
    }

    // Only use the first thread in a block to handle energy flooring
    if (use_energy && thread_id == 0) {
        float energy = log_energy[frame];
        float log_energy_floor = log(energy_floor);

        if (energy_floor > 0.0f && energy < log_energy_floor) {
            energy = log_energy_floor;
        }
        feats[0] = energy;
    }
}