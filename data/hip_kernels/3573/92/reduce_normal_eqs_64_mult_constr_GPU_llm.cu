#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce_normal_eqs_64_mult_constr_GPU(float *d_C_reduced, const float *d_C, int gridDim_x_normal_equations, int n_constraints) {
    int constraint_ind = blockIdx.x * 4 + threadIdx.y;

    if (constraint_ind < n_constraints) {
        int tid = 64 * threadIdx.y + threadIdx.x;
        int ind = blockIdx.y * n_constraints * gridDim_x_normal_equations * 64 +
                  constraint_ind * gridDim_x_normal_equations * 64 + threadIdx.x;

        __shared__ float DATA[64 * 4];

        // Load data into shared memory and perform reduction
        float tmp = 0.0f;
        for (int i = 0; i < gridDim_x_normal_equations; i++)
            tmp += d_C[ind + i * 64];
        DATA[tid] = tmp;

        __syncthreads();

        // Use warp shuffle for efficient reduction
        for (int offset = 32; offset > 0; offset /= 2) {
            tmp += __shfl_down_sync(0xFFFFFFFF, tmp, offset);
        }

        // Write results
        if (threadIdx.x == 0) {
            d_C_reduced[blockIdx.y * n_constraints + constraint_ind] = tmp;
        }
    }
}