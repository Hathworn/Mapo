#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tissueGPU3Kernel(float *d_tissxyz, float *d_vessxyz, float *d_pt000, float *d_qv000, int nnt, int nnv, int is2d, float req, float r2d) 
{
    int itp = blockDim.x * blockIdx.x + threadIdx.x;
    int nnv2 = 2 * nnv;
    float req2 = req * req;
    float r2d2 = r2d * r2d;
    
    if (itp < nnt) {
        float xt = d_tissxyz[itp];
        float yt = d_tissxyz[itp + nnt];
        float zt = d_tissxyz[itp + nnt * 2];
        float p = 0.0f;

        #pragma unroll // Unroll loop for improved performance
        for (int jvp = 0; jvp < nnv; jvp++) {
            float x = d_vessxyz[jvp] - xt;
            float y = d_vessxyz[jvp + nnv] - yt;
            float z = d_vessxyz[jvp + nnv2] - zt;
            float dist2 = x * x + y * y + z * z;
            
            float gtv;
            if (dist2 < req2) {
                if (is2d) gtv = log(r2d2 / req2) + 1.0f - dist2 / req2;
                else gtv = (1.5f - 0.5f * dist2 / req2) / req;
            } else {
                if (is2d) gtv = log(r2d2 / dist2);
                else gtv = 1.0f / sqrt(dist2);
            }
            p += d_qv000[jvp] * gtv;
        }
        d_pt000[itp] = p;
    }
}