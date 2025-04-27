#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuSetupSincKernel_kernel(float *r_filter_, const int i_filtercoef_, const float r_soff_, const float r_wgthgt_, const int i_weight_, const float r_soff_inverse_, const float r_beta_, const float r_decfactor_inverse_, const float r_relfiltlen_inverse_)
{
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i >= i_filtercoef_) return; // Correct boundary condition

    // Pre-calculate constant expressions and reuse them
    const float cosine_arg = PI * r_soff_inverse_;
    const float r_weight_height_diff = 1.0f - r_wgthgt_;

    float r_wa = i - r_soff_;
    float r_wgt = r_weight_height_diff + r_wgthgt_ * cos(r_wa * cosine_arg); // Use pre-calculated cosine argument

    float r_s = r_wa * r_beta_ * r_decfactor_inverse_ * PI;
    float r_fct = (r_s != 0.0f) ? sin(r_s) / r_s : 1.0f; // Simplified conditional assignment

    if (i_weight_ == 1) {
        r_filter_[i] = r_fct * r_wgt;
    } else {
        r_filter_[i] = r_fct;
    }
}