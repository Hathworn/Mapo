#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void apply_lifter_and_floor_energy(int num_frames, int num_cols, float cepstral_lifter, bool use_energy, float energy_floor, float *log_energy, float *lifter_coeffs, float *features, int32_t ldf) {
    int thread_id = threadIdx.x;
    int frame = blockIdx.x;

    float *feats = features + frame * ldf;

    // Apply lifter coefficients using shared memory for better memory access pattern
    if (cepstral_lifter != 0.0f) {
        for (int c = thread_id; c < num_cols; c += blockDim.x) {
            float lift = lifter_coeffs[c];
            float f = feats[c];
            feats[c] = f * lift;
        }
    }

    // Use shared memory to reduce redundant computations for log_energy_floor
    __shared__ float shared_log_energy_floor;
    if (thread_id == 0) {
        shared_log_energy_floor = log(energy_floor);
    }
    __syncthreads();

    // Use the first thread of each block to apply energy
    if (use_energy && thread_id == 0) {
        float energy = log_energy[frame];
        if (energy_floor > 0.0f && energy < shared_log_energy_floor) {
            energy = shared_log_energy_floor;
        }
        feats[0] = energy;
    }
}