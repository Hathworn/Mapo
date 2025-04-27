#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample_ind_and_labels_GPU(int *d_ind_sub, const int *d_ind, unsigned int *d_label_sub, const unsigned int *d_label, int n_out, float inv_sub_factor) {

    unsigned int ind_out = blockIdx.x * blockDim.x + threadIdx.x;

    if (ind_out < n_out) {
        // Use __fmul_rn for fast and precise multiplication
        int ind_in = __fmul_rn(ind_out, inv_sub_factor);
        d_ind_sub[ind_out] = __ldg(&d_ind[ind_in]); // Leverage __ldg for read-only cache
        d_label_sub[ind_out] = __ldg(&d_label[ind_in]); // Leverage __ldg for read-only cache
    }
}