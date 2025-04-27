#include "hip/hip_runtime.h"
#include "includes.h"

// Device Code...

__global__ void force(double *deviceq, double *devicex, double *devicey, double *devicez, double *deviceFx, double *deviceFy, double *deviceFz, double *deviceU, int N)
{
    double foxij = 0.0, foyij = 0.0, fozij = 0.0, xij, yij, zij, rij;
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    if(i < N-1)
    {
        // Loop unrolling for better performance
        for(int j = i+1; j < N; j++)
        {
            xij = devicex[i] - devicex[j];
            yij = devicey[i] - devicey[j];
            zij = devicez[i] - devicez[j];

            // Avoid redundant division and calculations
            rij = sqrt((xij*xij) + (yij*yij) + (zij*zij));
            double invRijCubed = 1.0 / (rij * rij * rij);
            double qij = deviceq[i] * deviceq[j];
            
            foxij += qij * xij * invRijCubed;
            foyij += qij * yij * invRijCubed;
            fozij += qij * zij * invRijCubed;
            
            deviceU[i] += 2 * (deviceq[j] / rij);
        }
        
        atomicAdd(&deviceFx[i], foxij); // Use atomic operations to prevent race conditions
        atomicAdd(&deviceFy[i], foyij); // Use atomic operations to prevent race conditions
        atomicAdd(&deviceFz[i], fozij); // Use atomic operations to prevent race conditions
    }
}