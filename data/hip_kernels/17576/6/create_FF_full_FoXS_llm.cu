#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void create_FF_full_FoXS ( float *FF_table, float *V, float c2, int *Ele, float *FF_full, int num_q, int num_ele, int num_atom, int num_atom2) {
    __shared__ float FF_pt[7];  // Shared memory to store form factors
    float hydration;
    int ii = blockIdx.x;  // Use a local variable for block index

    if (ii < num_q) {
        // Load form factors into shared memory
        for (int jj = threadIdx.x; jj < num_ele + 1; jj += blockDim.x) {
            FF_pt[jj] = FF_table[ii * (num_ele + 1) + jj];
        }
        __syncthreads();  // Synchronize to ensure all threads have updated shared memory

        hydration = c2 * FF_pt[num_ele];  // Compute hydration once per block

        // Calculate atomic form factor for each atom
        for (int jj = threadIdx.x; jj < num_atom; jj += blockDim.x) {
            int atomt = Ele[jj];
            FF_full[ii * num_atom2 + jj] = FF_pt[(atomt > 5) ? 0 : atomt] + hydration * V[jj];
        }
    }
}