#include "hip/hip_runtime.h"
#include "includes.h"
__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z) + (threadIdx.y * blockDim.x) + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void aux_fields(double *V, double *K, double gdt, double dt, double* Ax, double *Ay, double* Az, double *px, double *py, double *pz, double* pAx, double* pAy, double* pAz, double2* GV, double2* EV, double2* GK, double2* EK, double2* GpAx, double2* GpAy, double2* GpAz, double2* EpAx, double2* EpAy, double2* EpAz){
    int gid = getGid3d3d();
  
    // Pre-compute values that are reused
    double gdt_HBAR = gdt / HBAR;
    double dt_HBAR = dt / HBAR;
  
    // Calculate GV and GK using pre-computed values
    GV[gid].x = exp(-V[gid]*(gdt/(2*HBAR)));
    GK[gid].x = exp(-K[gid]*gdt_HBAR);
    GV[gid].y = 0.0;
    GK[gid].y = 0.0;

    // Pre-compute Ax, Ay, Az values
    double px_val = Ax[gid] * px[threadIdx.x];
    double py_val = Ay[gid] * py[threadIdx.y];
    double pz_val = Az[gid] * pz[threadIdx.z];
  
    pAx[gid] = px_val;
    pAy[gid] = py_val;
    pAz[gid] = pz_val;
  
    // Calculate GpAx, GpAy, GpAz using pre-computed values
    GpAx[gid].x = exp(-px_val * gdt);
    GpAx[gid].y = 0;
    GpAy[gid].x = exp(-py_val * gdt);
    GpAy[gid].y = 0;
    GpAz[gid].x = exp(-pz_val * gdt);
    GpAz[gid].y = 0;

    // Calculate EV, EK, EpAx, EpAy, EpAz using pre-computed values
    double common_factor = V[gid] * (dt / (2 * HBAR));
    EV[gid].x = cos(-common_factor);
    EV[gid].y = sin(-common_factor);
  
    common_factor = K[gid] * dt_HBAR;
    EK[gid].x = cos(-common_factor);
    EK[gid].y = sin(-common_factor);
  
    common_factor = pAz[gid] * dt;
    EpAz[gid].x = cos(-common_factor);
    EpAz[gid].y = sin(-common_factor);
  
    common_factor = pAy[gid] * dt;
    EpAy[gid].x = cos(-common_factor);
    EpAy[gid].y = sin(-common_factor);
  
    common_factor = pAx[gid] * dt;
    EpAx[gid].x = cos(-common_factor);
    EpAx[gid].y = sin(-common_factor);
}