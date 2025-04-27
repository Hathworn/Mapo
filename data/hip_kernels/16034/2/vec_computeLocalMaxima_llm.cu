#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_computeLocalMaxima(int n, int *localMaxima, int sizeImage, float *input, int sizeFilt, int edgeSizeReject)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;
    int id = idy * gridDim.x * blockDim.x + idx;

    if (id < n)
    {
        localMaxima[id] = 0;
        int sizeSquare = sizeImage * sizeImage;
        int z = id / sizeSquare;
        int p = id % sizeSquare;
        int x = p / sizeImage;
        int y = p % sizeImage;
        int sizeReject = max(sizeFilt, edgeSizeReject);

        if ((x >= sizeReject) && (y >= sizeReject) && (x + sizeReject < sizeImage) && (y + sizeReject < sizeImage))
        {
            bool isLocalMaxima = true;  // use boolean for better readability
            for (int a = -sizeFilt; a <= sizeFilt; a++)
            {
                for (int aa = -sizeFilt; aa <= sizeFilt; aa++)  // corrected variable name from `a` to `aa`
                {
                    int neighbor = z * sizeSquare + (x + a) * sizeImage + (y + aa);
                    if (input[id] < input[neighbor])
                    {
                        isLocalMaxima = false;
                        break;  // break from the inner loop
                    }
                }
                if (!isLocalMaxima)
                {
                    break;  // break from the outer loop when not a local maxima
                }
            }
            if (isLocalMaxima)
            {
                localMaxima[id] = 1;
            }
        }
    }
}