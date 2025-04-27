#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce_normal_eqs_64_mult_constr_GPU(float *d_C_reduced, const float *d_C, int gridDim_x_normal_equations, int n_constraints) {
    // Check if there are constraints left to be processed
    int constraint_ind = blockIdx.x * 4 + threadIdx.y;

    if (constraint_ind < n_constraints) {
        int tid = 64 * threadIdx.y + threadIdx.x;

        // Put data in shared memory
        int ind = blockIdx.y * n_constraints * gridDim_x_normal_equations * 64 +
                  constraint_ind * gridDim_x_normal_equations * 64 + threadIdx.x;

        __shared__ float DATA[64 * 4];

        // Load and sum the first gridDim_x_normal_equations elements
        float tmp = 0.0f;
        for (int i = 0; i < gridDim_x_normal_equations; i++)
            tmp += d_C[ind + i * 64];
        DATA[tid] = tmp;

        __syncthreads(); // Ensure reading stage has finished

        // Optimize warp-level reduction with loop and shared memory
        for (int offset = 32; offset > 0; offset /= 2) {
            if ((tid - 64 * threadIdx.y) < offset)
                DATA[tid] += DATA[tid + offset];
            __syncthreads();
        }

        // Write results
        if (threadIdx.x == 0)
            d_C_reduced[blockIdx.y * n_constraints + constraint_ind] = DATA[tid];
    }
}