#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cudaclaw5_update_q_cuda2(int mbc, int mx, int my, int meqn, double dtdx, double dtdy, double* qold, double* fm, double* fp, double* gm, double* gp)
{
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;

    if (ix < mx && iy < my)
    {
        int x_stride = meqn;
        int y_stride = (2 * mbc + mx) * x_stride;
        int I_q = (ix + mbc) * x_stride + (iy + mbc) * y_stride;

        // Optimize memory access inside loop by using constant offsets.
        int i_base = I_q;  // Base index for qold, fm, fp, gm, gp arrays

        for (int mq = 0; mq < meqn; mq++)
        {
            int i = i_base + mq;
            qold[i] -= dtdx * (fm[i + x_stride] - fp[i]) 
                     + dtdy * (gm[i + y_stride] - gp[i]);
        }
    }
}