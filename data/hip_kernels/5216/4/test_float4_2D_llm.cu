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

// Optimize the kernel to compute and store output based on block and thread indices
__global__ void test_float4_2D(float4 *output, float posX, float posY)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    float4 result = tex2D(texture_float4_2D, posX + idx, posY);  // Sample texture with offset based on index
    output[idx] = result;  // Store the calculated result
}