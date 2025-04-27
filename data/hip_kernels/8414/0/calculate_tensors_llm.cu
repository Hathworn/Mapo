#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_tensors(double* SR, const double* fields, const double* norms, const int num_modes, const int Nx) {
    unsigned int full_thread_idx = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int nmp4 = num_modes * num_modes * num_modes * num_modes;

    // Early exit if thread index is out of bounds
    if (full_thread_idx >= nmp4) {
        return;
    }

    // Pre-calculate these values outside the loop to reduce redundant computations
    unsigned int Nxnm = Nx * num_modes;
    unsigned int midx1 = full_thread_idx % num_modes;
    unsigned int midx2 = (full_thread_idx / num_modes) % num_modes;
    unsigned int midx3 = (full_thread_idx / (num_modes * num_modes)) % num_modes;
    unsigned int midx4 = (full_thread_idx / (num_modes * num_modes * num_modes)) % num_modes;
    
    double sum = 0.0;

    // Unroll loops for potential better performance
    for (int i = 0; i < Nx; i++) {
        unsigned int iimode = i * num_modes;
        for (int j = 0; j < Nx; j++) {
            unsigned int index = iimode + j * Nxnm;
            double f1 = fields[midx1 + index];
            double f2 = fields[midx2 + index];
            double f3 = fields[midx3 + index];
            double f4 = fields[midx4 + index];
            sum += f1 * f2 * f3 * f4;
        }
    }

    // Normalize and store the result
    SR[full_thread_idx] = sum / (norms[midx1] * norms[midx2] * norms[midx3] * norms[midx4]);
}