#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum_S_calc (float *S_calcc, float *f_ptxc, float *f_ptyc, float *f_ptzc, float *S_calc, float *Aq, float *q_S_ref_dS, int num_q, int num_atom, int num_atom2, float alpha, float k_chi, float *sigma2) {
    for (int ii = blockIdx.x; ii < num_q; ii += gridDim.x) {
        // Optimized reduction using parallel reduction
        for (int stride = num_atom2 / 2; stride > 0; stride >>= 1) {
            __syncthreads();
            for (int iAccum = threadIdx.x; iAccum < stride; iAccum += blockDim.x) {
                S_calcc[ii * num_atom2 + iAccum] += S_calcc[ii * num_atom2 + stride + iAccum];
            }
        }
        __syncthreads();

        S_calc[ii] = S_calcc[ii * num_atom2];

        // Simplified computation for Aq with shared memory usage
        __shared__ float shared_Aq;
        if (threadIdx.x == 0) {
            shared_Aq = S_calc[ii] - q_S_ref_dS[ii + num_q];
            shared_Aq *= -alpha;
            shared_Aq += q_S_ref_dS[ii + 2 * num_q];
            shared_Aq *= k_chi / sigma2[ii];
            shared_Aq += shared_Aq;
            Aq[ii] = shared_Aq;
        }
        __syncthreads();

        float local_Aq = shared_Aq;
        for (int jj = threadIdx.x; jj < num_atom; jj += blockDim.x) {
            f_ptxc[ii * num_atom2 + jj] *= local_Aq * alpha;
            f_ptyc[ii * num_atom2 + jj] *= local_Aq * alpha;
            f_ptzc[ii * num_atom2 + jj] *= local_Aq * alpha;
        }
    }
}