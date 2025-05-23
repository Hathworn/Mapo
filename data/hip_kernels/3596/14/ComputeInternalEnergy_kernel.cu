#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeInternalEnergy_kernel(float *Vx, float *Vy, float *Vz, float *Etot, float *Eneint, int size)
{
// get thread and block index
const long tx = threadIdx.x;
const long bx = blockIdx.x;
const long by = blockIdx.y;

int igrid;
igrid = tx + bx*CUDA_BLOCK_SIZE + by*CUDA_BLOCK_SIZE*CUDA_GRID_SIZE;

if (igrid >= size)
return;

// internal energy = total energy - kinetic energy
Eneint[igrid] = Etot[igrid] - 0.5*(Vx[igrid]*Vx[igrid] + Vy[igrid]*Vy[igrid] + Vz[igrid]*Vz[igrid]);

}