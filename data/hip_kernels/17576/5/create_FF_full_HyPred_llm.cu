#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void create_FF_full_HyPred ( float *FF_table, float *V, float c2_F, float *c2_H, int *Ele, float *FF_full, int num_q, int num_ele, int num_atom, int num_atom2) {

    __shared__ float FF_pt[7];
    __shared__ float hydration[10];

    for (int ii = blockIdx.x; ii < num_q; ii += gridDim.x) {
        // Load form factors into shared memory for this q vector
        if (ii < num_q) {
            for (int jj = threadIdx.x; jj < num_ele + 1; jj += blockDim.x) {
                FF_pt[jj] = FF_table[ii*(num_ele+1)+jj];
            }
        }
        __syncthreads();

        // Precompute hydration values in shared memory
        for (int jj = threadIdx.x; jj < 10; jj += blockDim.x) {
            hydration[jj] = c2_F * c2_H[jj] * FF_pt[num_ele];
        }
        __syncthreads();

        // Compute form factors for each atom
        for (int jj = threadIdx.x; jj < num_atom; jj += blockDim.x) {
            int atomt = Ele[jj];
            float ff_value = FF_pt[atomt > 5 ? 0 : atomt]; // Use branchless access
            FF_full[ii*num_atom2 + jj] = ff_value;
            FF_full[ii*num_atom2 + jj] += hydration[atomt] * V[jj];
        }
    }
}