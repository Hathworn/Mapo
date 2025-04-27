#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void StarRadKernel(double *Qbase2, double *Vrad, double *QStar, double dt, int nrad, int nsec, double *invdiffRmed, double *Rmed, double *dq) {
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Use shared memory for frequently accessed data to reduce global memory reads
    __shared__ double shared_invdiffRmed[1024];
    if (i < nrad) {
        shared_invdiffRmed[i] = invdiffRmed[i];
    }
    __syncthreads();

    if (i < nrad && j < nsec) {
        if (i == 0 || i == nrad - 1) {
            dq[i + j * nrad] = 0.0;
        } else {
            // Cache Qbase2 in registers to reduce global memory access within loop
            double Q_current = Qbase2[i * nsec + j];
            double Q_prev = Qbase2[(i - 1) * nsec + j];
            double Q_next = Qbase2[(i + 1) * nsec + j];
            
            double dqm = (Q_current - Q_prev) * shared_invdiffRmed[i];
            double dqp = (Q_next - Q_current) * shared_invdiffRmed[i + 1];

            if (dqp * dqm > 0.0) {
                dq[i + j * nrad] = 2.0 * dqp * dqm / (dqp + dqm);
            } else {
                dq[i + j * nrad] = 0.0;
            }
        }
    }
}