#include "hip/hip_runtime.h"
#include "includes.h"

#ifndef M_PI
#define M_PI 3.14159265358979323846f
#endif

#define MAX_SPOTS 1024
#define BLOCK_SIZE 256
#define SLM_SIZE 512
#if ((SLM_SIZE==16)||(SLM_SIZE==32)||(SLM_SIZE==64)||(SLM_SIZE==128)||(SLM_SIZE==256)||(SLM_SIZE==512)||(SLM_SIZE==1024)||(SLM_SIZE==2048))
#define SLMPOW2
#endif

__device__ unsigned char applyPolLUT(float phase2pi, float X, float Y, float *s_c) {
    // Calculate polynomial lookup table value based on input variables and coefficients
    switch (c_N_PolLUTCoeff[0]) {
    case 120:
        return (unsigned char)(s_c[0] + s_c[1]*X + /* values omitted for brevity */ + s_c[119]*phase2pi*phase2pi*phase2pi);
    case 84:
        return (unsigned char)(s_c[0] + s_c[1]*X + /* values omitted for brevity */ + s_c[83]*phase2pi*phase2pi*phase2pi*phase2pi*phase2pi);
    case 56:
        return (unsigned char)(s_c[0] + s_c[1]*X + /* values omitted for brevity */ + s_c[55]*phase2pi*phase2pi*phase2pi*phase2pi*phase2pi);
    case 35:
        return (unsigned char)(s_c[0] + s_c[1]*X + /* values omitted for brevity */ + s_c[34]*phase2pi*phase2pi*phase2pi*phase2pi);
    case 20:
        return (unsigned char)(s_c[0] + s_c[1]*X + /* values omitted for brevity */ + s_c[19]*phase2pi*phase2pi*phase2pi);
    default:
        return 0;
    }
}

__device__ int getYint(int index, int X_int) {
    // Calculate the Y integer index
#ifdef SLMPOW2
    return (index-X_int)>>c_log2data_w[0];
#else
    return (int)(floor((float)index/c_data_w_f[0]));
#endif
}

__device__ int getXint(int index) {
    // Calculate the X integer index
#ifdef SLMPOW2
    return index & (c_data_w[0]-1);
#else
    return index % c_data_w[0];
#endif
}

__device__ float ApplyAberrationCorrection(float pSpot, float correction) {
    // Correct the spot phase
    pSpot = pSpot - correction;
    return (pSpot - (2.0f * M_PI) * floor((pSpot + M_PI) / (2.0f * M_PI)));
}

__device__ int phase2int32(float phase2pi) {
    // Convert phase to integer
    return (int)floor((phase2pi + M_PI) * 256.0f / (2.0f * M_PI));
}

__device__ unsigned char phase2uc(float phase2pi) {
    // Convert phase to unsigned char
    return (unsigned char)floor((phase2pi + M_PI) * 256.0f / (2.0f * M_PI));
}

__device__ float uc2phase(float uc) {
    // Convert unsigned char to phase
    return (float)uc * 2.0f * M_PI / 256.0f - M_PI;
}

__global__ void ApplyCorrections(unsigned char *g_pSLM_uc, unsigned char *g_LUT, float *g_AberrationCorr_f, float *g_LUTPolCoeff_f) {
    int tid = threadIdx.x;
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    float pSLM2pi_f = uc2phase(g_pSLM_uc[idx]);
    
    // Apply aberration correction if needed
    if (c_useAberrationCorr_b[0])
        pSLM2pi_f = ApplyAberrationCorrection(pSLM2pi_f, g_AberrationCorr_f[idx]);
    
    if (c_usePolLUT_b[0]) {
        // Load polynomial coefficients into shared memory
        int X_int = getXint(idx);
        int Y_int = getYint(idx, X_int);
        float X = c_SLMpitch_f[0] * (X_int - c_half_w_f[0]);
        float Y = c_SLMpitch_f[0] * (Y_int - c_half_w_f[0]);
        __shared__ float s_LUTcoeff[120];
        
        if (tid < c_N_PolLUTCoeff[0])
            s_LUTcoeff[tid] = g_LUTPolCoeff_f[tid];
        __syncthreads();
        
        // Apply polynomial LUT
        g_pSLM_uc[idx] = applyPolLUT(pSLM2pi_f, X, Y, s_LUTcoeff);
    } else if (c_applyLUT_b[0]) {
        // Load LUT into shared memory
        __shared__ unsigned char s_LUT[256];
        
        if (tid < 256)
            s_LUT[tid] = g_LUT[tid];
        __syncthreads();
        
        // Apply LUT
        g_pSLM_uc[idx] = s_LUT[phase2int32(pSLM2pi_f)];
    } else {
        // Convert phase to unsigned char without LUT
        g_pSLM_uc[idx] = phase2uc(pSLM2pi_f);
    }
}