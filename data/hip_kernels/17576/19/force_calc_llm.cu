#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void force_calc(float *Force, int num_atom, int num_q, float *f_ptxc, float *f_ptyc, float *f_ptzc, int num_atom2, int num_q2, int *Ele, float force_ramp) {
    // Exit if block index is out of bounds
    if (blockIdx.x >= num_atom) return;

    // Iterate over atoms assigned to each block
    for (int ii = blockIdx.x; ii < num_atom; ii += gridDim.x) {
        // Perform parallel reduction using efficient iteration and synchronization
        for (int stride = num_q2 / 2; stride > 0; stride >>= 1) {
            __syncthreads();
            int idx = threadIdx.x;
            while (idx < stride) {
                int offset = idx * num_atom2;
                f_ptxc[ii + offset] += f_ptxc[ii + offset + stride * num_atom2];
                f_ptyc[ii + offset] += f_ptyc[ii + offset + stride * num_atom2];
                f_ptzc[ii + offset] += f_ptzc[ii + offset + stride * num_atom2];
                idx += blockDim.x;
            }
        }
        __syncthreads();

        // Accumulate results back to global memory
        if (threadIdx.x == 0 && Ele[ii]) {
            Force[ii * 3    ] = f_ptxc[ii] * force_ramp;
            Force[ii * 3 + 1] = f_ptyc[ii] * force_ramp;
            Force[ii * 3 + 2] = f_ptzc[ii] * force_ramp;
        }
        __syncthreads();
    }
}