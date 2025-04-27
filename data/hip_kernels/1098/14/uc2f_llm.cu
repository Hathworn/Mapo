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

__global__ void uc2f(float *f, unsigned char *uc, int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure only needed threads run the computation, this can help prevent wasted resources
    if (idx < N) {
        // Precompute constant to avoid redundant calculation and reduce instruction count
        const float coeff = 2.0f * M_PI / 256.0f;
        f[idx] = uc[idx] * coeff - M_PI;
    }
}