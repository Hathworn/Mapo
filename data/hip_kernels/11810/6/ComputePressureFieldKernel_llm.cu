#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputePressureFieldKernel(double *SoundSpeed, double *Dens, double *Pressure, int Adiabatic, int nrad, int nsec, double ADIABATICINDEX, double *Energy) {
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i < nrad && j < nsec) {
        int idx = i * nsec + j; // Compute once, reuse index
        if (!Adiabatic) {
            double speed = SoundSpeed[idx]; // Avoid duplicate memory access
            Pressure[idx] = Dens[idx] * speed * speed;
        } else {
            Pressure[idx] = (ADIABATICINDEX - 1.0) * Energy[idx];
        }
    }
}