#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void force_calc_EMA(float *Force, double *Force_old, int num_atom, int num_q, float *f_ptxc, float *f_ptyc, float *f_ptzc, int num_atom2, int num_q2, int *Ele, double EMA_norm, float force_ramp) {
    if (blockIdx.x >= num_atom) return;

    for (int ii = blockIdx.x; ii < num_atom; ii += gridDim.x) {
        // Optimize stride loop using shared memory
        extern __shared__ float shared_ptx[], shared_pty[], shared_ptz[];
        for (int iAccum = threadIdx.x; iAccum < num_q2; iAccum += blockDim.x) {
            shared_ptx[iAccum] = f_ptxc[ii + iAccum * num_atom2];
            shared_pty[iAccum] = f_ptyc[ii + iAccum * num_atom2];
            shared_ptz[iAccum] = f_ptzc[ii + iAccum * num_atom2];
        }
        __syncthreads();

        for (int stride = num_q2 / 2; stride > 0; stride >>= 1) {
            if (threadIdx.x < stride) {
                shared_ptx[threadIdx.x] += shared_ptx[threadIdx.x + stride];
                shared_pty[threadIdx.x] += shared_pty[threadIdx.x + stride];
                shared_ptz[threadIdx.x] += shared_ptz[threadIdx.x + stride];
            }
            __syncthreads();
        }

        if (threadIdx.x == 0) {
            if (Ele[ii]) {
                // Use atomic operations to avoid race conditions
                atomicAdd(&Force_old[ii * 3], (EMA_norm - 1.0) * Force_old[ii * 3] - (double)shared_ptx[0]);
                atomicAdd(&Force_old[ii * 3 + 1], (EMA_norm - 1.0) * Force_old[ii * 3 + 1] - (double)shared_pty[0]);
                atomicAdd(&Force_old[ii * 3 + 2], (EMA_norm - 1.0) * Force_old[ii * 3 + 2] - (double)shared_ptz[0]);

                Force[ii * 3] = (float)(Force_old[ii * 3] / EMA_norm) * force_ramp;
                Force[ii * 3 + 1] = (float)(Force_old[ii * 3 + 1] / EMA_norm) * force_ramp;
                Force[ii * 3 + 2] = (float)(Force_old[ii * 3 + 2] / EMA_norm) * force_ramp;
            }
        }
        __syncthreads();
    }
}