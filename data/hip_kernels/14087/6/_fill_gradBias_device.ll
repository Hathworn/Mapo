; ModuleID = '../data/hip_kernels/14087/6/main.cu'
source_filename = "../data/hip_kernels/14087/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14_fill_gradBiasPfPKffiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %6, %5
  %10 = mul i32 %9, %8
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %1, i64 %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %17, label %15

15:                                               ; preds = %7
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  br label %40

17:                                               ; preds = %7
  %18 = mul i32 %9, %4
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %20 = icmp slt i32 %19, %9
  br label %21

21:                                               ; preds = %17, %36
  %22 = phi i32 [ %13, %17 ], [ %38, %36 ]
  %23 = phi float [ 0.000000e+00, %17 ], [ %37, %36 ]
  %24 = mul i32 %18, %22
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %12, i64 %25
  br i1 %20, label %27, label %36

27:                                               ; preds = %21, %27
  %28 = phi i32 [ %34, %27 ], [ %19, %21 ]
  %29 = phi float [ %33, %27 ], [ %23, %21 ]
  %30 = zext i32 %28 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %26, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = fadd contract float %29, %32
  %34 = add nuw nsw i32 %28, 32
  %35 = icmp slt i32 %34, %9
  br i1 %35, label %27, label %36, !llvm.loop !10

36:                                               ; preds = %27, %21
  %37 = phi float [ %23, %21 ], [ %33, %27 ]
  %38 = add nuw nsw i32 %22, 4
  %39 = icmp slt i32 %38, %3
  br i1 %39, label %21, label %40, !llvm.loop !12

40:                                               ; preds = %36, %15
  %41 = phi i32 [ %16, %15 ], [ %19, %36 ]
  %42 = phi float [ 0.000000e+00, %15 ], [ %37, %36 ]
  %43 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %44 = getelementptr i8, i8 addrspace(4)* %43, i64 4
  %45 = bitcast i8 addrspace(4)* %44 to i16 addrspace(4)*
  %46 = load i16, i16 addrspace(4)* %45, align 4, !range !13, !invariant.load !9
  %47 = zext i16 %46 to i32
  %48 = mul nuw nsw i32 %13, %47
  %49 = add nuw nsw i32 %48, %41
  %50 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 %49
  store float %42, float addrspace(3)* %50, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %51 = icmp eq i32 %41, 0
  br i1 %51, label %52, label %312

52:                                               ; preds = %40
  %53 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 0), align 16, !tbaa !5
  %54 = fadd contract float %53, 0.000000e+00
  %55 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 1), align 4, !tbaa !5
  %56 = fadd contract float %54, %55
  %57 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 2), align 8, !tbaa !5
  %58 = fadd contract float %56, %57
  %59 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 3), align 4, !tbaa !5
  %60 = fadd contract float %58, %59
  %61 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 4), align 16, !tbaa !5
  %62 = fadd contract float %60, %61
  %63 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 5), align 4, !tbaa !5
  %64 = fadd contract float %62, %63
  %65 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 6), align 8, !tbaa !5
  %66 = fadd contract float %64, %65
  %67 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 7), align 4, !tbaa !5
  %68 = fadd contract float %66, %67
  %69 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 8), align 16, !tbaa !5
  %70 = fadd contract float %68, %69
  %71 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 9), align 4, !tbaa !5
  %72 = fadd contract float %70, %71
  %73 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 10), align 8, !tbaa !5
  %74 = fadd contract float %72, %73
  %75 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 11), align 4, !tbaa !5
  %76 = fadd contract float %74, %75
  %77 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 12), align 16, !tbaa !5
  %78 = fadd contract float %76, %77
  %79 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 13), align 4, !tbaa !5
  %80 = fadd contract float %78, %79
  %81 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 14), align 8, !tbaa !5
  %82 = fadd contract float %80, %81
  %83 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 15), align 4, !tbaa !5
  %84 = fadd contract float %82, %83
  %85 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 16), align 16, !tbaa !5
  %86 = fadd contract float %84, %85
  %87 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 17), align 4, !tbaa !5
  %88 = fadd contract float %86, %87
  %89 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 18), align 8, !tbaa !5
  %90 = fadd contract float %88, %89
  %91 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 19), align 4, !tbaa !5
  %92 = fadd contract float %90, %91
  %93 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 20), align 16, !tbaa !5
  %94 = fadd contract float %92, %93
  %95 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 21), align 4, !tbaa !5
  %96 = fadd contract float %94, %95
  %97 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 22), align 8, !tbaa !5
  %98 = fadd contract float %96, %97
  %99 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 23), align 4, !tbaa !5
  %100 = fadd contract float %98, %99
  %101 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 24), align 16, !tbaa !5
  %102 = fadd contract float %100, %101
  %103 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 25), align 4, !tbaa !5
  %104 = fadd contract float %102, %103
  %105 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 26), align 8, !tbaa !5
  %106 = fadd contract float %104, %105
  %107 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 27), align 4, !tbaa !5
  %108 = fadd contract float %106, %107
  %109 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 28), align 16, !tbaa !5
  %110 = fadd contract float %108, %109
  %111 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 29), align 4, !tbaa !5
  %112 = fadd contract float %110, %111
  %113 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 30), align 8, !tbaa !5
  %114 = fadd contract float %112, %113
  %115 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 31), align 4, !tbaa !5
  %116 = fadd contract float %114, %115
  %117 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 32), align 16, !tbaa !5
  %118 = fadd contract float %116, %117
  %119 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 33), align 4, !tbaa !5
  %120 = fadd contract float %118, %119
  %121 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 34), align 8, !tbaa !5
  %122 = fadd contract float %120, %121
  %123 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 35), align 4, !tbaa !5
  %124 = fadd contract float %122, %123
  %125 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 36), align 16, !tbaa !5
  %126 = fadd contract float %124, %125
  %127 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 37), align 4, !tbaa !5
  %128 = fadd contract float %126, %127
  %129 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 38), align 8, !tbaa !5
  %130 = fadd contract float %128, %129
  %131 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 39), align 4, !tbaa !5
  %132 = fadd contract float %130, %131
  %133 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 40), align 16, !tbaa !5
  %134 = fadd contract float %132, %133
  %135 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 41), align 4, !tbaa !5
  %136 = fadd contract float %134, %135
  %137 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 42), align 8, !tbaa !5
  %138 = fadd contract float %136, %137
  %139 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 43), align 4, !tbaa !5
  %140 = fadd contract float %138, %139
  %141 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 44), align 16, !tbaa !5
  %142 = fadd contract float %140, %141
  %143 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 45), align 4, !tbaa !5
  %144 = fadd contract float %142, %143
  %145 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 46), align 8, !tbaa !5
  %146 = fadd contract float %144, %145
  %147 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 47), align 4, !tbaa !5
  %148 = fadd contract float %146, %147
  %149 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 48), align 16, !tbaa !5
  %150 = fadd contract float %148, %149
  %151 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 49), align 4, !tbaa !5
  %152 = fadd contract float %150, %151
  %153 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 50), align 8, !tbaa !5
  %154 = fadd contract float %152, %153
  %155 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 51), align 4, !tbaa !5
  %156 = fadd contract float %154, %155
  %157 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 52), align 16, !tbaa !5
  %158 = fadd contract float %156, %157
  %159 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 53), align 4, !tbaa !5
  %160 = fadd contract float %158, %159
  %161 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 54), align 8, !tbaa !5
  %162 = fadd contract float %160, %161
  %163 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 55), align 4, !tbaa !5
  %164 = fadd contract float %162, %163
  %165 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 56), align 16, !tbaa !5
  %166 = fadd contract float %164, %165
  %167 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 57), align 4, !tbaa !5
  %168 = fadd contract float %166, %167
  %169 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 58), align 8, !tbaa !5
  %170 = fadd contract float %168, %169
  %171 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 59), align 4, !tbaa !5
  %172 = fadd contract float %170, %171
  %173 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 60), align 16, !tbaa !5
  %174 = fadd contract float %172, %173
  %175 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 61), align 4, !tbaa !5
  %176 = fadd contract float %174, %175
  %177 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 62), align 8, !tbaa !5
  %178 = fadd contract float %176, %177
  %179 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 63), align 4, !tbaa !5
  %180 = fadd contract float %178, %179
  %181 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 64), align 16, !tbaa !5
  %182 = fadd contract float %180, %181
  %183 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 65), align 4, !tbaa !5
  %184 = fadd contract float %182, %183
  %185 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 66), align 8, !tbaa !5
  %186 = fadd contract float %184, %185
  %187 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 67), align 4, !tbaa !5
  %188 = fadd contract float %186, %187
  %189 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 68), align 16, !tbaa !5
  %190 = fadd contract float %188, %189
  %191 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 69), align 4, !tbaa !5
  %192 = fadd contract float %190, %191
  %193 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 70), align 8, !tbaa !5
  %194 = fadd contract float %192, %193
  %195 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 71), align 4, !tbaa !5
  %196 = fadd contract float %194, %195
  %197 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 72), align 16, !tbaa !5
  %198 = fadd contract float %196, %197
  %199 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 73), align 4, !tbaa !5
  %200 = fadd contract float %198, %199
  %201 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 74), align 8, !tbaa !5
  %202 = fadd contract float %200, %201
  %203 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 75), align 4, !tbaa !5
  %204 = fadd contract float %202, %203
  %205 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 76), align 16, !tbaa !5
  %206 = fadd contract float %204, %205
  %207 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 77), align 4, !tbaa !5
  %208 = fadd contract float %206, %207
  %209 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 78), align 8, !tbaa !5
  %210 = fadd contract float %208, %209
  %211 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 79), align 4, !tbaa !5
  %212 = fadd contract float %210, %211
  %213 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 80), align 16, !tbaa !5
  %214 = fadd contract float %212, %213
  %215 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 81), align 4, !tbaa !5
  %216 = fadd contract float %214, %215
  %217 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 82), align 8, !tbaa !5
  %218 = fadd contract float %216, %217
  %219 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 83), align 4, !tbaa !5
  %220 = fadd contract float %218, %219
  %221 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 84), align 16, !tbaa !5
  %222 = fadd contract float %220, %221
  %223 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 85), align 4, !tbaa !5
  %224 = fadd contract float %222, %223
  %225 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 86), align 8, !tbaa !5
  %226 = fadd contract float %224, %225
  %227 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 87), align 4, !tbaa !5
  %228 = fadd contract float %226, %227
  %229 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 88), align 16, !tbaa !5
  %230 = fadd contract float %228, %229
  %231 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 89), align 4, !tbaa !5
  %232 = fadd contract float %230, %231
  %233 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 90), align 8, !tbaa !5
  %234 = fadd contract float %232, %233
  %235 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 91), align 4, !tbaa !5
  %236 = fadd contract float %234, %235
  %237 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 92), align 16, !tbaa !5
  %238 = fadd contract float %236, %237
  %239 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 93), align 4, !tbaa !5
  %240 = fadd contract float %238, %239
  %241 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 94), align 8, !tbaa !5
  %242 = fadd contract float %240, %241
  %243 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 95), align 4, !tbaa !5
  %244 = fadd contract float %242, %243
  %245 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 96), align 16, !tbaa !5
  %246 = fadd contract float %244, %245
  %247 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 97), align 4, !tbaa !5
  %248 = fadd contract float %246, %247
  %249 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 98), align 8, !tbaa !5
  %250 = fadd contract float %248, %249
  %251 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 99), align 4, !tbaa !5
  %252 = fadd contract float %250, %251
  %253 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 100), align 16, !tbaa !5
  %254 = fadd contract float %252, %253
  %255 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 101), align 4, !tbaa !5
  %256 = fadd contract float %254, %255
  %257 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 102), align 8, !tbaa !5
  %258 = fadd contract float %256, %257
  %259 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 103), align 4, !tbaa !5
  %260 = fadd contract float %258, %259
  %261 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 104), align 16, !tbaa !5
  %262 = fadd contract float %260, %261
  %263 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 105), align 4, !tbaa !5
  %264 = fadd contract float %262, %263
  %265 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 106), align 8, !tbaa !5
  %266 = fadd contract float %264, %265
  %267 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 107), align 4, !tbaa !5
  %268 = fadd contract float %266, %267
  %269 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 108), align 16, !tbaa !5
  %270 = fadd contract float %268, %269
  %271 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 109), align 4, !tbaa !5
  %272 = fadd contract float %270, %271
  %273 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 110), align 8, !tbaa !5
  %274 = fadd contract float %272, %273
  %275 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 111), align 4, !tbaa !5
  %276 = fadd contract float %274, %275
  %277 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 112), align 16, !tbaa !5
  %278 = fadd contract float %276, %277
  %279 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 113), align 4, !tbaa !5
  %280 = fadd contract float %278, %279
  %281 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 114), align 8, !tbaa !5
  %282 = fadd contract float %280, %281
  %283 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 115), align 4, !tbaa !5
  %284 = fadd contract float %282, %283
  %285 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 116), align 16, !tbaa !5
  %286 = fadd contract float %284, %285
  %287 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 117), align 4, !tbaa !5
  %288 = fadd contract float %286, %287
  %289 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 118), align 8, !tbaa !5
  %290 = fadd contract float %288, %289
  %291 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 119), align 4, !tbaa !5
  %292 = fadd contract float %290, %291
  %293 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 120), align 16, !tbaa !5
  %294 = fadd contract float %292, %293
  %295 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 121), align 4, !tbaa !5
  %296 = fadd contract float %294, %295
  %297 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 122), align 8, !tbaa !5
  %298 = fadd contract float %296, %297
  %299 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 123), align 4, !tbaa !5
  %300 = fadd contract float %298, %299
  %301 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 124), align 16, !tbaa !5
  %302 = fadd contract float %300, %301
  %303 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 125), align 4, !tbaa !5
  %304 = fadd contract float %302, %303
  %305 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 126), align 8, !tbaa !5
  %306 = fadd contract float %304, %305
  %307 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ14_fill_gradBiasPfPKffiiiiE6shGrad, i32 0, i32 127), align 4, !tbaa !5
  %308 = fadd contract float %306, %307
  %309 = fmul contract float %308, %2
  %310 = zext i32 %8 to i64
  %311 = getelementptr inbounds float, float addrspace(1)* %0, i64 %310
  store float %309, float addrspace(1)* %311, align 4, !tbaa !5
  br label %312

312:                                              ; preds = %52, %40
  ret void
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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = !{i16 1, i16 1025}
