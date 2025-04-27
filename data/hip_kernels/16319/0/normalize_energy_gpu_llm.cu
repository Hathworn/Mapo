#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_energy_gpu(float *ksn2e, float *ksn2f, double omega_re, double omega_im, float *nm2v_re, float *nm2v_im, int nfermi, int norbs, int nvirt, int vstart)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // nocc
    int j = blockIdx.y * blockDim.y + threadIdx.y; // nvirt

    // Early exit if indices are out of bounds for improved efficiency
    if (i >= nfermi || j >= norbs - vstart) return;

    float en = ksn2e[i];
    float fn = ksn2f[i];
    float em = ksn2e[j + vstart];
    float fm = ksn2f[j + vstart];

    double d1p = omega_re - (em - en);
    double d1pp = omega_im;
    double d2p = omega_re + (em - en);
    double d2pp = omega_im;

    double d1p_denom = d1p*d1p + d1pp*d1pp;
    double d2p_denom = d2p*d2p + d2pp*d2pp;

    // Precompute factors to minimize arithmetic operations
    double alpha = d1p/d1p_denom - d2p/d2p_denom;
    double beta = -d1pp/d1p_denom + d2pp/d2p_denom;

    float old_re = nm2v_re[i*nvirt + j];
    float old_im = nm2v_im[i*nvirt + j];

    // Update nm2v_re and nm2v_im using precomputed factors
    nm2v_re[i*nvirt + j] = (fn - fm) * (old_re * alpha - old_im * beta);
    nm2v_im[i*nvirt + j] = (fn - fm) * (old_re * beta + old_im * alpha);
}