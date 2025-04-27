#include "hip/hip_runtime.h"
#include "includes.h"

/*
* JCuda - Java bindings for NVIDIA CUDA driver and runtime API
* http://www.jcuda.org
*
* Copyright 2010 Marco Hutter - http://www.jcuda.org
*/

/**
* Kernels for the JCudaDriverTextureTest class. These
* kernels will read data via the texture references at
* the given positions, and store the value that is
* read into the given output memory.
*/

texture<float,  1, hipReadModeElementType> texture_float_1D;
texture<float,  2, hipReadModeElementType> texture_float_2D;
texture<float,  3, hipReadModeElementType> texture_float_3D;

texture<float4, 1, hipReadModeElementType> texture_float4_1D;
texture<float4, 2, hipReadModeElementType> texture_float4_2D;
texture<float4, 3, hipReadModeElementType> texture_float4_3D;

extern "C"

__global__ void test_float4_3D(float4 *output, float posX, float posY, float posZ)
{
    // Calculate the index for the output using unique thread identifiers
    const int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Read texture at the given position
    float4 result = tex3D(texture_float4_3D, posX, posY, posZ);

    // Store the result in the output array at the calculated index
    output[idx] = result;
}