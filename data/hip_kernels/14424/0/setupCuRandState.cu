#include "hip/hip_runtime.h"
#include "includes.h"
// Copyright 2013-2014 [Author: Po-Wei Chou]
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

using namespace std;

__global__ void setupCuRandState( hiprandState * state, unsigned long seed ) {
int x = blockIdx.x*blockDim.x + threadIdx.x;
hiprand_init ( seed, x, 0, &state[x] );
}