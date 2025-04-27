#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuSincInterpolation_kernel(const int nImages, const float * imagesIn, const int inNX, const int inNY, float * imagesOut, const int outNX, const int outNY, const float * r_filter_, const int i_covs_, const int i_decfactor_, const int i_intplength_, const int i_startX, const int i_startY, const int i_int_size)
{
    int idxImage = blockIdx.z;
    int idxX = threadIdx.x + blockDim.x * blockIdx.x;
    int idxY = threadIdx.y + blockDim.y * blockIdx.y;
    
    if (idxImage >= nImages || idxX >= i_int_size || idxY >= i_int_size) return;

    int outx = idxX + i_startX;
    int outy = idxY + i_startY;
    int idxOut = idxImage * outNX * outNY + outx * outNY + outy;

    float r_xout = static_cast<float>(outx) / i_covs_;
    int i_xout = __float2int_rz(r_xout);  // Use fast intrinsic function
    float r_xfrac = r_xout - i_xout;
    int i_xfrac = __float2int_rz(r_xfrac * i_decfactor_);  // Use fast intrinsic function

    float r_yout = static_cast<float>(outy) / i_covs_;
    int i_yout = __float2int_rz(r_yout);  // Use fast intrinsic function
    float r_yfrac = r_yout - i_yout;
    int i_yfrac = __float2int_rz(r_yfrac * i_decfactor_);  // Use fast intrinsic function

    float intpData = 0.0f;
    float r_sincwgt = 0.0f;
    float r_sinc_coef;

    for (int i = 0; i < inNX; i++) {
        int i_xindex = i_xout - i + i_intplength_ / 2;
        i_xindex = (i_xindex + i_intplength_) % i_intplength_;  // Use modulo for index wrapping
        float r_xsinc_coef = r_filter_[i_xindex * i_decfactor_ + i_xfrac];

        for (int j = 0; j < inNY; j++) {
            int i_yindex = i_yout - j + i_intplength_ / 2;
            i_yindex = (i_yindex + i_intplength_) % i_intplength_;  // Use modulo for index wrapping
            float r_ysinc_coef = r_filter_[i_yindex * i_decfactor_ + i_yfrac];
            r_sinc_coef = r_xsinc_coef * r_ysinc_coef;
            r_sincwgt += r_sinc_coef;
            intpData += imagesIn[idxImage * inNX * inNY + i * inNY + j] * r_sinc_coef;
        }
    }
    imagesOut[idxOut] = intpData / r_sincwgt;
}