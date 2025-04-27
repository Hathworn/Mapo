#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeConstantResidualKernel (double *VMed, double *invRmed, int *Nshift, int *NoSplitAdvection, int nsec, int nrad, double dt, double *Vtheta, double *VthetaRes, double *Rmed, int FastTransport)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i < nrad && j < nsec) {
        // Use ternary operator for maxfrac
        double maxfrac = FastTransport ? 1.0 : 0.0;

        double invdt = 1.0 / dt;
        double dpinvns = 2.0 * PI / (double)nsec;
        double Ntilde = VMed[i] * invRmed[i] * dt * (double)nsec / (2.0 * PI);
        double Nround = floor(Ntilde + 0.5);

        // Direct assignment to Nshift
        Nshift[i] = (long)Nround;

        double Vtheta_val = (Ntilde - Nround) * Rmed[i] * invdt * dpinvns;
        Vtheta[i * nsec + j] = Vtheta_val;
        
        // Use direct condition without intermediate variable for branching
        if (maxfrac < 0.5) {
            NoSplitAdvection[i] = YES;
            VthetaRes[i * nsec + j] += Vtheta_val;
            Vtheta[i * nsec + j] = 0.0;
        } else {
            NoSplitAdvection[i] = NO;
        }
    }
}