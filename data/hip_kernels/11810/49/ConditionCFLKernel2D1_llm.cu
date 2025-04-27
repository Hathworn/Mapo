#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double min2(double a, double b)
{
    return b < a ? b : a;
}

__device__ double max2(double a, double b)
{
    return b > a ? b : a;
}

__global__ void ConditionCFLKernel2D1 (double *Rsup, double *Rinf, double *Rmed, int nsec, int nrad, double *Vresidual, double *Vtheta, double *Vmoy, int FastTransport, double *SoundSpeed, double *Vrad, double *DT2D)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i > 0 && i < nrad && j < nsec) {

        double dxrad = Rsup[i] - Rinf[i];
        double dxtheta = Rmed[i] * 2.0 * PI / (double)nsec;

        // Use ternary operator for simplicity and potential performance gain
        Vresidual[i * nsec + j] = FastTransport ? (Vtheta[i * nsec + j] - Vmoy[i]) : Vtheta[i * nsec + j];

        double invdt1 = SoundSpeed[i * nsec + j] / min2(dxrad, dxtheta);
        double invdt2 = fabs(Vrad[i * nsec + j]) / dxrad;
        double invdt3 = fabs(Vresidual[i * nsec + j]) / dxtheta;

        // Simplifying velocity difference calculation
        double dvr = Vrad[(i + 1) * nsec + j] - Vrad[i * nsec + j];
        double dvt = Vtheta[i * nsec + (j + 1) % nsec] - Vtheta[i * nsec + j];

        // Ensure non-negative values with a ternary operator
        dvr = dvr >= 0.0 ? 1e-10 : -dvr;
        dvt = dvt >= 0.0 ? 1e-10 : -dvt;

        double invdt4 = max2(dvr / dxrad, dvt / dxtheta);
        invdt4 *= 4.0 * CVNR * CVNR;
        
        double dt = CFLSECURITY / sqrt(invdt1 * invdt1 + invdt2 * invdt2 + invdt3 * invdt3 + invdt4 * invdt4);
        DT2D[i * nsec + j] = dt; // array nrad*nsec size dt
    }
}