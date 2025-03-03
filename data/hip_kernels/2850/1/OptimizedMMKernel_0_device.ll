; ModuleID = '../data/hip_kernels/2850/1/main.cu'
source_filename = "../data/hip_kernels/2850/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16
@_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19OptimizedMMKernel_0PfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %5
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %6
  %22 = udiv i32 %3, %12
  %23 = icmp sgt i32 %22, 0
  %24 = mul nsw i32 %21, %3
  br i1 %23, label %25, label %157

25:                                               ; preds = %4
  %26 = add i32 %24, %5
  %27 = shl nuw nsw i32 %6, 5
  %28 = add nuw nsw i32 %27, %5
  %29 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %28
  %30 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %28
  %31 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %27
  %32 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %5
  %33 = add nuw nsw i32 %27, 1
  %34 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %33
  %35 = add nuw nsw i32 %5, 32
  %36 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %35
  %37 = add nuw nsw i32 %27, 2
  %38 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %37
  %39 = add nuw nsw i32 %5, 64
  %40 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %39
  %41 = add nuw nsw i32 %27, 3
  %42 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %41
  %43 = add nuw nsw i32 %5, 96
  %44 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %43
  %45 = add nuw nsw i32 %27, 4
  %46 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %45
  %47 = add nuw nsw i32 %5, 128
  %48 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %47
  %49 = add nuw nsw i32 %27, 5
  %50 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %49
  %51 = add nuw nsw i32 %5, 160
  %52 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %51
  %53 = add nuw nsw i32 %27, 6
  %54 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %53
  %55 = add nuw nsw i32 %5, 192
  %56 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %55
  %57 = add nuw nsw i32 %27, 7
  %58 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %57
  %59 = add nuw nsw i32 %5, 224
  %60 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %59
  %61 = add nuw nsw i32 %27, 8
  %62 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %61
  %63 = add nuw nsw i32 %5, 256
  %64 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %63
  %65 = add nuw nsw i32 %27, 9
  %66 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %65
  %67 = add nuw nsw i32 %5, 288
  %68 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %67
  %69 = add nuw nsw i32 %27, 10
  %70 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %69
  %71 = add nuw nsw i32 %5, 320
  %72 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %71
  %73 = add nuw nsw i32 %27, 11
  %74 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %73
  %75 = add nuw nsw i32 %5, 352
  %76 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %75
  %77 = add nuw nsw i32 %27, 12
  %78 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %77
  %79 = add nuw nsw i32 %5, 384
  %80 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %79
  %81 = add nuw nsw i32 %27, 13
  %82 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %81
  %83 = add nuw nsw i32 %5, 416
  %84 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %83
  %85 = add nuw nsw i32 %27, 14
  %86 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %85
  %87 = add nuw nsw i32 %5, 448
  %88 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %87
  %89 = add nuw nsw i32 %27, 15
  %90 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %89
  %91 = add nuw nsw i32 %5, 480
  %92 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %91
  %93 = add nuw nsw i32 %27, 16
  %94 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %93
  %95 = add nuw nsw i32 %5, 512
  %96 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %95
  %97 = add nuw nsw i32 %27, 17
  %98 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %97
  %99 = add nuw nsw i32 %5, 544
  %100 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %99
  %101 = add nuw nsw i32 %27, 18
  %102 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %101
  %103 = add nuw nsw i32 %5, 576
  %104 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %103
  %105 = add nuw nsw i32 %27, 19
  %106 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %105
  %107 = add nuw nsw i32 %5, 608
  %108 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %107
  %109 = add nuw nsw i32 %27, 20
  %110 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %109
  %111 = add nuw nsw i32 %5, 640
  %112 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %111
  %113 = add nuw nsw i32 %27, 21
  %114 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %113
  %115 = add nuw nsw i32 %5, 672
  %116 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %115
  %117 = add nuw nsw i32 %27, 22
  %118 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %117
  %119 = add nuw nsw i32 %5, 704
  %120 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %119
  %121 = add nuw nsw i32 %27, 23
  %122 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %121
  %123 = add nuw nsw i32 %5, 736
  %124 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %123
  %125 = add nuw nsw i32 %27, 24
  %126 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %125
  %127 = add nuw nsw i32 %5, 768
  %128 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %127
  %129 = add nuw nsw i32 %27, 25
  %130 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %129
  %131 = add nuw nsw i32 %5, 800
  %132 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %131
  %133 = add nuw nsw i32 %27, 26
  %134 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %133
  %135 = add nuw nsw i32 %5, 832
  %136 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %135
  %137 = add nuw nsw i32 %27, 27
  %138 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %137
  %139 = add nuw nsw i32 %5, 864
  %140 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %139
  %141 = add nuw nsw i32 %27, 28
  %142 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %141
  %143 = add nuw nsw i32 %5, 896
  %144 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %143
  %145 = add nuw nsw i32 %27, 29
  %146 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %145
  %147 = add nuw nsw i32 %5, 928
  %148 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %147
  %149 = add nuw nsw i32 %27, 30
  %150 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %149
  %151 = add nuw nsw i32 %5, 960
  %152 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %151
  %153 = add nuw nsw i32 %27, 31
  %154 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedA, i32 0, i32 %153
  %155 = add nuw nsw i32 %5, 992
  %156 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ19OptimizedMMKernel_0PfS_S_iE7sharedB, i32 0, i32 %155
  br label %162

157:                                              ; preds = %162, %4
  %158 = phi float [ 0.000000e+00, %4 ], [ %303, %162 ]
  %159 = add nsw i32 %24, %14
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %2, i64 %160
  store float %158, float addrspace(1)* %161, align 4, !tbaa !7
  ret void

162:                                              ; preds = %25, %162
  %163 = phi i32 [ 0, %25 ], [ %304, %162 ]
  %164 = phi float [ 0.000000e+00, %25 ], [ %303, %162 ]
  %165 = shl nsw i32 %163, 5
  %166 = add i32 %26, %165
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %0, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !7, !amdgpu.noclobber !6
  store float %169, float addrspace(3)* %29, align 4, !tbaa !7
  %170 = add nuw i32 %165, %6
  %171 = mul i32 %170, %3
  %172 = add nsw i32 %171, %14
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %1, i64 %173
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !7, !amdgpu.noclobber !6
  store float %175, float addrspace(3)* %30, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %176 = load float, float addrspace(3)* %31, align 16, !tbaa !7
  %177 = load float, float addrspace(3)* %32, align 4, !tbaa !7
  %178 = fmul contract float %176, %177
  %179 = fadd contract float %164, %178
  %180 = load float, float addrspace(3)* %34, align 4, !tbaa !7
  %181 = load float, float addrspace(3)* %36, align 4, !tbaa !7
  %182 = fmul contract float %180, %181
  %183 = fadd contract float %179, %182
  %184 = load float, float addrspace(3)* %38, align 8, !tbaa !7
  %185 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %186 = fmul contract float %184, %185
  %187 = fadd contract float %183, %186
  %188 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %189 = load float, float addrspace(3)* %44, align 4, !tbaa !7
  %190 = fmul contract float %188, %189
  %191 = fadd contract float %187, %190
  %192 = load float, float addrspace(3)* %46, align 16, !tbaa !7
  %193 = load float, float addrspace(3)* %48, align 4, !tbaa !7
  %194 = fmul contract float %192, %193
  %195 = fadd contract float %191, %194
  %196 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %197 = load float, float addrspace(3)* %52, align 4, !tbaa !7
  %198 = fmul contract float %196, %197
  %199 = fadd contract float %195, %198
  %200 = load float, float addrspace(3)* %54, align 8, !tbaa !7
  %201 = load float, float addrspace(3)* %56, align 4, !tbaa !7
  %202 = fmul contract float %200, %201
  %203 = fadd contract float %199, %202
  %204 = load float, float addrspace(3)* %58, align 4, !tbaa !7
  %205 = load float, float addrspace(3)* %60, align 4, !tbaa !7
  %206 = fmul contract float %204, %205
  %207 = fadd contract float %203, %206
  %208 = load float, float addrspace(3)* %62, align 16, !tbaa !7
  %209 = load float, float addrspace(3)* %64, align 4, !tbaa !7
  %210 = fmul contract float %208, %209
  %211 = fadd contract float %207, %210
  %212 = load float, float addrspace(3)* %66, align 4, !tbaa !7
  %213 = load float, float addrspace(3)* %68, align 4, !tbaa !7
  %214 = fmul contract float %212, %213
  %215 = fadd contract float %211, %214
  %216 = load float, float addrspace(3)* %70, align 8, !tbaa !7
  %217 = load float, float addrspace(3)* %72, align 4, !tbaa !7
  %218 = fmul contract float %216, %217
  %219 = fadd contract float %215, %218
  %220 = load float, float addrspace(3)* %74, align 4, !tbaa !7
  %221 = load float, float addrspace(3)* %76, align 4, !tbaa !7
  %222 = fmul contract float %220, %221
  %223 = fadd contract float %219, %222
  %224 = load float, float addrspace(3)* %78, align 16, !tbaa !7
  %225 = load float, float addrspace(3)* %80, align 4, !tbaa !7
  %226 = fmul contract float %224, %225
  %227 = fadd contract float %223, %226
  %228 = load float, float addrspace(3)* %82, align 4, !tbaa !7
  %229 = load float, float addrspace(3)* %84, align 4, !tbaa !7
  %230 = fmul contract float %228, %229
  %231 = fadd contract float %227, %230
  %232 = load float, float addrspace(3)* %86, align 8, !tbaa !7
  %233 = load float, float addrspace(3)* %88, align 4, !tbaa !7
  %234 = fmul contract float %232, %233
  %235 = fadd contract float %231, %234
  %236 = load float, float addrspace(3)* %90, align 4, !tbaa !7
  %237 = load float, float addrspace(3)* %92, align 4, !tbaa !7
  %238 = fmul contract float %236, %237
  %239 = fadd contract float %235, %238
  %240 = load float, float addrspace(3)* %94, align 16, !tbaa !7
  %241 = load float, float addrspace(3)* %96, align 4, !tbaa !7
  %242 = fmul contract float %240, %241
  %243 = fadd contract float %239, %242
  %244 = load float, float addrspace(3)* %98, align 4, !tbaa !7
  %245 = load float, float addrspace(3)* %100, align 4, !tbaa !7
  %246 = fmul contract float %244, %245
  %247 = fadd contract float %243, %246
  %248 = load float, float addrspace(3)* %102, align 8, !tbaa !7
  %249 = load float, float addrspace(3)* %104, align 4, !tbaa !7
  %250 = fmul contract float %248, %249
  %251 = fadd contract float %247, %250
  %252 = load float, float addrspace(3)* %106, align 4, !tbaa !7
  %253 = load float, float addrspace(3)* %108, align 4, !tbaa !7
  %254 = fmul contract float %252, %253
  %255 = fadd contract float %251, %254
  %256 = load float, float addrspace(3)* %110, align 16, !tbaa !7
  %257 = load float, float addrspace(3)* %112, align 4, !tbaa !7
  %258 = fmul contract float %256, %257
  %259 = fadd contract float %255, %258
  %260 = load float, float addrspace(3)* %114, align 4, !tbaa !7
  %261 = load float, float addrspace(3)* %116, align 4, !tbaa !7
  %262 = fmul contract float %260, %261
  %263 = fadd contract float %259, %262
  %264 = load float, float addrspace(3)* %118, align 8, !tbaa !7
  %265 = load float, float addrspace(3)* %120, align 4, !tbaa !7
  %266 = fmul contract float %264, %265
  %267 = fadd contract float %263, %266
  %268 = load float, float addrspace(3)* %122, align 4, !tbaa !7
  %269 = load float, float addrspace(3)* %124, align 4, !tbaa !7
  %270 = fmul contract float %268, %269
  %271 = fadd contract float %267, %270
  %272 = load float, float addrspace(3)* %126, align 16, !tbaa !7
  %273 = load float, float addrspace(3)* %128, align 4, !tbaa !7
  %274 = fmul contract float %272, %273
  %275 = fadd contract float %271, %274
  %276 = load float, float addrspace(3)* %130, align 4, !tbaa !7
  %277 = load float, float addrspace(3)* %132, align 4, !tbaa !7
  %278 = fmul contract float %276, %277
  %279 = fadd contract float %275, %278
  %280 = load float, float addrspace(3)* %134, align 8, !tbaa !7
  %281 = load float, float addrspace(3)* %136, align 4, !tbaa !7
  %282 = fmul contract float %280, %281
  %283 = fadd contract float %279, %282
  %284 = load float, float addrspace(3)* %138, align 4, !tbaa !7
  %285 = load float, float addrspace(3)* %140, align 4, !tbaa !7
  %286 = fmul contract float %284, %285
  %287 = fadd contract float %283, %286
  %288 = load float, float addrspace(3)* %142, align 16, !tbaa !7
  %289 = load float, float addrspace(3)* %144, align 4, !tbaa !7
  %290 = fmul contract float %288, %289
  %291 = fadd contract float %287, %290
  %292 = load float, float addrspace(3)* %146, align 4, !tbaa !7
  %293 = load float, float addrspace(3)* %148, align 4, !tbaa !7
  %294 = fmul contract float %292, %293
  %295 = fadd contract float %291, %294
  %296 = load float, float addrspace(3)* %150, align 8, !tbaa !7
  %297 = load float, float addrspace(3)* %152, align 4, !tbaa !7
  %298 = fmul contract float %296, %297
  %299 = fadd contract float %295, %298
  %300 = load float, float addrspace(3)* %154, align 4, !tbaa !7
  %301 = load float, float addrspace(3)* %156, align 4, !tbaa !7
  %302 = fmul contract float %300, %301
  %303 = fadd contract float %299, %302
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %304 = add nuw nsw i32 %163, 1
  %305 = icmp eq i32 %304, %22
  br i1 %305, label %157, label %162, !llvm.loop !11
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
