#include "hip/hip_runtime.h"
#include "includes.h"
__device__ void updateCMax(const int nbrOfGrids, const double *d_u1, const double *d_u2, const double *d_u3, const double *d_gama, double *d_cMax)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    __shared__ double sharedMax[256]; // Use shared memory for partial max values
    double localMax = 0; // Local max for this thread
    double ro, p, u;
    
    for (int i = index; i < nbrOfGrids; i += stride) {
        if (d_u1[i] == 0) continue;
        ro = d_u1[i];
        u = d_u2[i] / ro;
        p = (d_u3[i] - ro * u * u / 2) * (*d_gama - 1);
        double c = sqrt(*d_gama * abs(p) / ro);
        double speed = c + abs(u);
        if (localMax < speed) localMax = speed; // Update local max
    }
    
    sharedMax[threadIdx.x] = localMax; // Each thread writes its local max to shared memory
    __syncthreads(); // Ensure all threads have finished writing to shared
    
    // Perform reduction to find the maximum speed in the block
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            sharedMax[threadIdx.x] = fmax(sharedMax[threadIdx.x], sharedMax[threadIdx.x + s]);
        }
        __syncthreads();
    }
    
    if (threadIdx.x == 0) atomicMax(d_cMax, sharedMax[0]); // Use atomicMax to update global max
}

__global__ void initDeviceMemory(const int nbrOfGrids, double *d_u1, double *d_u2, double *d_u3, double *d_vol, double *d_h, double *d_length, double *d_gama, double *d_cfl, double *d_nu, double *d_tau, double *d_cMax, double *d_t) {
    *d_t = 0; // time
    *d_length = 1; // length of shock tube
    *d_gama = 1.4; // ratio of specific heats
    *d_cfl = 0.9; // Courant-Friedrichs-Lewy number
    *d_nu = 0.0; // artificial viscosity coefficient
    *d_h = *d_length / (nbrOfGrids - 1); // space grid size
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x;
    
    for (int i = index; i < nbrOfGrids; i += stride) {
        double e, ro, p, u = 0;
        if (i < nbrOfGrids) {
            if (i >= int(nbrOfGrids / 2)) { ro = 0.125, p = 0.1; }
            else { ro = 1, p = 1; }
            e = p / (*d_gama - 1) + ro * u * u / 2;
            d_u1[i] = ro;
            d_u2[i] = ro * u;
            d_u3[i] = e;
            d_vol[i] = 1;
        }
    }
    
    updateCMax(nbrOfGrids, d_u1, d_u2, d_u3, d_gama, d_cMax);
    *d_tau = (*d_cfl) * (*d_h) / (*d_cMax); // initial time grid size, It will be modified to tMax if this > tMax
}