#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void StarRadKernel2 (double *Qbase2, double *Vrad, double *QStar, double dt, int nrad, int nsec, double *invdiffRmed, double *Rmed, double *dq)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Ensure indices are within bounds
    if (i < nrad && j < nsec) {
        double deltaR = Rmed[i] - (i > 0 ? Rmed[i-1] : Rmed[i+1]);
        double term = deltaR - Vrad[i*nsec + j] * dt;
        double dq_value = dq[i == 0 ? j*nrad : i-1+j*nrad];
        
        // Conditional assignments utilizing ternary operator for simplicity
        QStar[i*nsec + j] = Qbase2[(i > 0 ? i-1 : i)*nsec + j] - term * 0.5 * dq_value;
    }

    // Ensuring QStar has zero value for specific conditions
    if (i == 0 && j < nsec) {
        QStar[j] = QStar[j+nsec*nrad] = 0.0;
    }
}