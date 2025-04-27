#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z) 
                 + (threadIdx.z * blockDim.y * blockDim.x) 
                 + (threadIdx.y * blockDim.x) 
                 + threadIdx.x;
    return threadId;
}

__global__ void aux_fields(double *V, double *K, double gdt, double dt, double* Ax, double *Ay, double* Az, double *px, double *py, double *pz, double* pAx, double* pAy, double* pAz, double2* GV, double2* EV, double2* GK, double2* EK, double2* GpAx, double2* GpAy, double2* GpAz, double2* EpAx, double2* EpAy, double2* EpAz) {
    int gid = getGid3d3d();
    int xid = blockDim.x * blockIdx.x + threadIdx.x;
    int yid = blockDim.y * blockIdx.y + threadIdx.y;
    int zid = blockDim.z * blockIdx.z + threadIdx.z;

    double v_factor = V[gid] * (gdt / (2 * HBAR));
    double k_factor = K[gid] * (gdt / HBAR);
    GV[gid] = make_double2(exp(-v_factor), 0.0); // Combine initialization
    GK[gid] = make_double2(exp(-k_factor), 0.0); 

    // Precompute for magnetic field calculations
    // Use registers to reduce memory access latency
    double px_val = Ax[gid] * px[xid];
    double py_val = Ay[gid] * py[yid];
    double pz_val = Az[gid] * pz[zid];
    
    pAx[gid] = px_val;
    pAy[gid] = py_val;
    pAz[gid] = pz_val;

    GpAx[gid] = make_double2(exp(-px_val * gdt), 0.0);
    GpAy[gid] = make_double2(exp(-py_val * gdt), 0.0);
    GpAz[gid] = make_double2(exp(-pz_val * gdt), 0.0);

    double ev_factor = V[gid] * (dt / (2 * HBAR));
    double ek_factor = K[gid] * (dt / HBAR);
    
    EV[gid].x = cos(-ev_factor); // Precompute sine and cosine
    EV[gid].y = sin(-ev_factor);
    EK[gid].x = cos(-ek_factor);
    EK[gid].y = sin(-ek_factor);

    EpAz[gid].x = cos(-pz_val * dt);
    EpAz[gid].y = sin(-pz_val * dt);
    EpAy[gid].x = cos(-py_val * dt);
    EpAy[gid].y = sin(-py_val * dt);
    EpAx[gid].x = cos(-px_val * dt);
    EpAx[gid].y = sin(-px_val * dt);
}