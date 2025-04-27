#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_divCorrelation(int n, float *x, int sizeImage, float *varImage, float *varPSF)
{
    // Calculate thread and block index for flattened 2D grid
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;
    int id = idy * gridDim.x * blockDim.x + idx;
    
    // Continue if within bounds
    if (id < n)
    {
        int lengthImage = sizeImage * sizeImage;
        int positInImage = id % lengthImage;
        int zposit = id / lengthImage;
        
        // Compute division only if non-negative
        float div = varImage[positInImage] * varPSF[zposit];
        if (div > 0) {
            x[id] = x[id] / sqrtf(div); // Use sqrtf for float type
        } else {
            x[id] = -1;
        }
    }
}