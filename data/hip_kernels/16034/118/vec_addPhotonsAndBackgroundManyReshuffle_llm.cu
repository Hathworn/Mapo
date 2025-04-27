#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_addPhotonsAndBackgroundManyReshuffle (int n, int sizeSubImage,int numberPSFperModel,double *output, double *input, double *photonAndBackground)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Unroll loop to improve memory coalescing
    for(int i = id; i < n; i += stride) {
        int idPSF = i / sizeSubImage;
        int idModel = idPSF / numberPSFperModel;
        int idoffset = i % sizeSubImage;
        int idposit = idPSF % numberPSFperModel;
        int idreshuffle = idModel * sizeSubImage + idposit * sizeSubImage * (n / (sizeSubImage * numberPSFperModel)) + idoffset;
        
        // Use temporary variables for repeated calculations
        double photonBg1 = photonAndBackground[idPSF * 2];
        double photonBg2 = photonAndBackground[idPSF * 2 + 1];
        
        output[idreshuffle] = input[i] * photonBg1 + photonBg2;
    }
}
```
