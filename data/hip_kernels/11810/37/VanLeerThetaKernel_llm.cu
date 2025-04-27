#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VanLeerThetaKernel(double *Rsup, double *Rinf, double *Surf, double dt, int nrad, int nsec, int UniformTransport, int *NoSplitAdvection, double *QRStar, double *DensStar, double *Vazimutal_d, double *Qbase)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i < nrad && j < nsec)
    {
        // Only perform computations when conditions are met
        if ((UniformTransport == NO) || (NoSplitAdvection[i] == NO))
        {
            double dxrad = (Rsup[i] - Rinf[i]) * dt;
            double invsurf = 1.0 / Surf[i];
            double varq = dxrad * QRStar[i * nsec + j] * DensStar[i * nsec + j] * Vazimutal_d[i * nsec + j];
            
            // Reduce redundant calculations
            int next_j = (j + 1) % nsec;
            varq -= dxrad * QRStar[i * nsec + next_j] * DensStar[i * nsec + next_j] * Vazimutal_d[i * nsec + next_j];
            
            Qbase[i * nsec + j] += varq * invsurf;
        }
    }
}