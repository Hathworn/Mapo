#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ConditionCFLKernel2D2 (double *newDT, double *DT2D, double *DT1D, double *Vmoy, double *invRmed, int *CFL, int nsec, int nrad, double DeltaT)
{
  // Calculate 'i' index for the current thread using block and thread indices
  int i = threadIdx.x + blockDim.x * blockIdx.x;
  double newdt = 1e30; // Initialize newdt to a large value instead of repeating inside the loop

  // Only proceed if 'i' is within valid range
  if (i < nrad) {
    if (i > 0) { // Ensure 'i' is greater than 0 to proceed with the inner loop
      newDT[i] = newdt; // Initialize newDT with a large value
      for (int k = 0; k < nsec; k++) {
        // Compare each DT2D value and update newDT with the minimum
        newDT[i] = fmin(newDT[i], DT2D[i * nsec + k]);
      }
    }
    if (i < nrad - 1) {
      // Calculate dt only when 'i' is within valid range
      double dt = 2.0 * PI * CFLSECURITY / (double)nsec / fabs(Vmoy[i] * invRmed[i] - Vmoy[i + 1] * invRmed[i + 1]);
      DT1D[i] = dt; // Update DT1D with calculated dt values
    }
  }
}