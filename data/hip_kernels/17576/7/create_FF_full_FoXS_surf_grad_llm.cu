#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void create_FF_full_FoXS_surf_grad(float *FF_table, float *V, float c2, int *Ele, float *FF_full, float *surf_grad, int num_q, int num_ele, int num_atom, int num_atom2) {
    __shared__ float FF_pt[7];
    float hydration;

    for (int ii = blockIdx.x; ii < num_q + 1; ii += gridDim.x) {
        // Get form factor for this block (or q vector)
        if (ii < num_q) {
            // Efficient use of shared memory
            for (int jj = threadIdx.x; jj < num_ele + 1; jj += blockDim.x) {
                FF_pt[jj] = FF_table[ii * (num_ele + 1) + jj];
            }
        }
        __syncthreads();

        // Calculate hydration factor
        hydration = c2 * FF_pt[num_ele];
        __syncthreads();

        if (ii == num_q) {
            // Calculate surface gradient
            for (int jj = threadIdx.x; jj < num_atom; jj += blockDim.x) {
                surf_grad[3 * jj] *= c2;
                surf_grad[3 * jj + 1] *= c2;
                surf_grad[3 * jj + 2] *= c2;
            }
        } else {
            // Calculate atomic form factor
            for (int jj = threadIdx.x; jj < num_atom; jj += blockDim.x) {
                int atomt = Ele[jj];
                float form_factor = (atomt > 5) ? FF_pt[0] : FF_pt[atomt];

                // Optimize memory access
                FF_full[ii * num_atom2 + jj] = form_factor + hydration * V[jj];
            }
        }

        if (threadIdx.x == 0) {
            FF_full[ii * num_atom2 + num_atom + 1] = FF_pt[num_ele];
        }
    }
}