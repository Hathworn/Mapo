#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaclaw5_update_q_cuda(int mbc, double dtdx, double dtdy, double* qold, double* fm, double* fp, double* gm, double* gp)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global x index
    int y = blockIdx.y * blockDim.y + threadIdx.y;  // Calculate global y index
    
    if (x >= mbc && y >= mbc) {  // Boundary check for x and y
        int mq = threadIdx.z;
        int x_stride = blockDim.z;
        int y_stride = (blockDim.x + 2*mbc) * x_stride;
        int i = mq + (x + mbc) * x_stride + (y + mbc) * y_stride;
        qold[i] = qold[i] - dtdx * (fm[i + x_stride] - fp[i])
                           - dtdy * (gm[i + y_stride] - gp[i]);
    }
}