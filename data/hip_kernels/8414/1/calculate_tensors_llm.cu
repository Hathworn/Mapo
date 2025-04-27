#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_tensors(float* SR, const float* fields, const float* norms, const int num_modes, const int Nx) {
    unsigned int full_thread_idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Calculate the index
    unsigned int nmp4 = num_modes * num_modes * num_modes * num_modes;
    unsigned int Nxnm = Nx * num_modes;

    if (full_thread_idx >= nmp4) {
        return;
    }

    // Turn linear index into components
    unsigned int midx1 = full_thread_idx % num_modes;
    unsigned int midx2 = (full_thread_idx / num_modes) % num_modes;
    unsigned int midx3 = (full_thread_idx / num_modes / num_modes) % num_modes;
    unsigned int midx4 = (full_thread_idx / num_modes / num_modes / num_modes);

    float sum = 0.0f;
    // Use registers for accumulation
    for (int i = 0; i < Nx; i++) {
        for (int j = 0; j < Nx; j++) {
            // Load field values once per iteration
            float field1 = fields[midx1 + i * num_modes + j * Nxnm];
            float field2 = fields[midx2 + i * num_modes + j * Nxnm];
            float field3 = fields[midx3 + i * num_modes + j * Nxnm];
            float field4 = fields[midx4 + i * num_modes + j * Nxnm];
            sum += field1 * field2 * field3 * field4;
        }
    }

    // Normalize
    float norm = norms[midx1] * norms[midx2] * norms[midx3] * norms[midx4];
    SR[full_thread_idx] = sum / norm; // Store normalized result
}